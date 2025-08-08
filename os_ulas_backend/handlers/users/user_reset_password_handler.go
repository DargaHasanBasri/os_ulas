package handlers

import (
	"fmt"
	"math/rand"
	"net/http"
	"os_ulas_backend/models"
	"os_ulas_backend/utils"
	"strings"
	"time"

	"github.com/gin-gonic/gin"
)

// Kodları ve süresini hafızada tut (DB kullanmıyorsan geçici olarak bu iş görür)
var emailCodeMap = make(map[string]string)       // email -> kod
var emailCodeExpiry = make(map[string]time.Time) // email -> expire time

// 1. Kod Gönderme Endpoint'i
func SendResetCode(c *gin.Context) {
	var req struct {
		Email string `json:"email"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Geçersiz veri"})
		return
	}

	user, err := models.GetUserByEmail(strings.TrimSpace(req.Email))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Kullanıcı bulunamadı"})
		return
	}

	// 4 haneli kod üret (örneğin 3842)
	code := fmt.Sprintf("%04d", rand.Intn(10000))
	emailCodeMap[user.Email] = code
	emailCodeExpiry[user.Email] = time.Now().Add(10 * time.Minute)

	body := fmt.Sprintf("Merhaba,\n\nŞifrenizi sıfırlamak için doğrulama kodunuz: %s\n\nKod 10 dakika geçerlidir.", code)
	err = utils.SendSimpleEmail(user.Email, "Şifre Sıfırlama Kodu", body)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Kod gönderilemedi"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Doğrulama kodu e-posta adresinize gönderildi."})
}

// 2. Kod ve Yeni Şifre Gönderme Endpoint'i
func ResetPasswordWithCode(c *gin.Context) {
	var req struct {
		Email       string `json:"email"`
		Code        string `json:"code"`
		NewPassword string `json:"new_password"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Geçersiz veri"})
		return
	}

	email := strings.TrimSpace(req.Email)
	code := strings.TrimSpace(req.Code)

	// Kod kontrol
	expectedCode, exists := emailCodeMap[email]
	expiry, expiryExists := emailCodeExpiry[email]
	if !exists || !expiryExists || time.Now().After(expiry) {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Kod geçersiz veya süresi dolmuş"})
		return
	}
	if expectedCode != code {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Kod hatalı"})
		return
	}

	// Şifre güncelle
	hashed, err := utils.HashPassword(req.NewPassword)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Şifre hashlenemedi"})
		return
	}

	err = models.UpdatePasswordByEmail(email, hashed)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Şifre güncellenemedi"})
		return
	}

	// Kod temizleniyor
	delete(emailCodeMap, email)
	delete(emailCodeExpiry, email)

	c.JSON(http.StatusOK, gin.H{"message": "Şifre başarıyla güncellendi."})
}
