package handlers

import (
	"net/http"               // HTTP sabitleri ve durum kodları için kullanılır
	"os_ulas_backend/config" // Veritabanı bağlantısını içerir
	"os_ulas_backend/models" // User gibi veritabanı modellerini içerir
	"os_ulas_backend/utils"

	"github.com/gin-gonic/gin" // HTTP framework — handler fonksiyonları ve JSON yanıtları için kullanılır
	"github.com/google/uuid"   // UUID (benzersiz kimlik) işlemleri için kullanılır
)

// Tüm kullanıcıları getiren handler fonksiyonu
func GetAllUsers(c *gin.Context) {
	// Kullanıcıları tutacak slice tanımı
	var users []models.User

	// Veritabanından tüm kullanıcıları çeker
	result := config.DB.Find(&users)

	// Eğer hata varsa, 500 Internal Server Error döner
	if result.Error != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": result.Error.Error()})
		return
	}

	// Başarılıysa kullanıcıları 200 OK ile döner
	c.JSON(http.StatusOK, users)
}

// Belirli bir kullanıcıyı ID ile getiren handler fonksiyonu
func GetUser(c *gin.Context) {
	// URL'den gelen "id" parametresini alır
	id := c.Param("id")

	// Kullanıcıyı tutacak değişken
	var user models.User

	// uuid.Parse ile string'ten UUID'ye çevirir
	uid, err := uuid.Parse(id)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Geçersiz ID formatı"})
		return
	}

	// UUID ile kullanıcıyı veritabanından bul
	result := config.DB.First(&user, "id = ?", uid)

	// Eğer kullanıcı bulunamazsa 404 Not Found dön
	if result.Error != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Kullanıcı bulunamadı"})
		return
	}

	// Başarılıysa kullanıcıyı 200 OK ile döner
	c.JSON(http.StatusOK, user)
}

func UpdateEmail(c *gin.Context) {
	type RequestBody struct {
		NewEmail string `json:"new_email"`
	}

	var req RequestBody
	if err := c.ShouldBindJSON(&req); err != nil || req.NewEmail == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Yeni e-posta gerekli"})
		return
	}

	// JWT ile kullanıcı epostası al
	userEmail, err := utils.ExtractEmailFromToken(c)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Geçersiz token"})
		return
	}

	var user models.User
	if err := config.DB.Where("email = ?", userEmail).First(&user).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Kullanıcı bulunamadı"})
		return
	}

	// Yeni doğrulama token'ı oluştur
	verificationToken, err := utils.GenerateRandomToken()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Token oluşturulamadı"})
		return
	}

	// Eposta güncelle
	user.Email = req.NewEmail
	user.IsVerified = false
	user.VerificationToken = verificationToken

	if err := config.DB.Save(&user).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "E-posta güncellenemedi"})
		return
	}

	// Yeni mail adresine doğrulama e-postası gönder
	if err := utils.SendVerificationEmail(req.NewEmail, verificationToken); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Doğrulama e-postası gönderilemedi"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Yeni e-posta adresinize doğrulama bağlantısı gönderildi"})
}

func UpdatePassword(c *gin.Context) {
	type RequestBody struct {
		CurrentPassword string `json:"current_password"`
		NewPassword     string `json:"new_password"`
	}

	var req RequestBody
	if err := c.ShouldBindJSON(&req); err != nil || req.CurrentPassword == "" || req.NewPassword == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Tüm alanlar zorunlu"})
		return
	}

	// Token'dan kullanıcı email'ini al
	userEmail, err := utils.ExtractEmailFromToken(c)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Geçersiz token"})
		return
	}

	var user models.User
	if err := config.DB.Where("email = ?", userEmail).First(&user).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Kullanıcı bulunamadı"})
		return
	}

	// Mevcut şifreyi doğrula
	if !utils.CheckPasswordHash(req.CurrentPassword, user.Password) {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Mevcut şifre hatalı"})
		return
	}

	// Yeni şifreyi hashle
	hashedPassword, err := utils.HashPassword(req.NewPassword)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Yeni şifre hashlenemedi"})
		return
	}

	// Şifreyi güncelle
	user.Password = hashedPassword
	if err := config.DB.Save(&user).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Şifre güncellenemedi"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Şifre başarıyla güncellendi"})
}

func DeleteAccount(c *gin.Context) {
	// Token'dan e-posta adresini al
	userEmail, err := utils.ExtractEmailFromToken(c)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Geçersiz token"})
		return
	}

	var user models.User
	if err := config.DB.Where("email = ?", userEmail).First(&user).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Kullanıcı bulunamadı"})
		return
	}

	// KULLANICIYI VERİTABANINDAN KALICI OLARAK SİL
	if err := config.DB.Unscoped().Delete(&user).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Hesap silinemedi"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Hesap tamamen silindi"})
}
