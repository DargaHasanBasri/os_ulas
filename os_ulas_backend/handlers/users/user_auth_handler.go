package handlers

import (
	"os_ulas_backend/config" // Veritabanı bağlantısını içerir
	"time"

	"net/http"               // HTTP sabitleri ve durum kodları için kullanılır
	"os_ulas_backend/models" // User gibi veritabanı modellerini içerir
	"os_ulas_backend/utils"  // Şifreleme ve JWT gibi yardımcı fonksiyonları içerir

	"github.com/gin-gonic/gin" // HTTP framework — handler fonksiyonları ve JSON yanıtları için kullanılır
)

// Register: Yeni kullanıcıyı kaydeder
func Register(c *gin.Context) {
	var input struct {
		Name     string `json:"name" binding:"required"`
		Email    string `json:"email" binding:"required,email"`
		Password string `json:"password" binding:"required,min=6"`
	}

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// E-posta zaten kayıtlı mı kontrol et
	var existing models.User
	if err := config.DB.Where("email = ?", input.Email).First(&existing).Error; err == nil {
		c.JSON(http.StatusConflict, gin.H{"error": "Bu e-posta zaten kayıtlı"})
		return
	}

	// Doğrulama token'ı oluştur
	verificationToken, err := utils.GenerateVerificationToken()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Token oluşturulamadı"})
		return
	}

	now := time.Now()

	// Kullanıcıyı oluştur
	user := models.User{
		Name:                    input.Name,
		Email:                   input.Email,
		Password:                input.Password,
		VerificationToken:       verificationToken,
		VerificationEmailSentAt: &now,
		RefreshToken:            "",
		RefreshTokenExpiry:      nil,
	}

	if err := config.DB.Create(&user).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Kullanıcı oluşturulamadı"})
		return
	}

	// Doğrulama e-postasını gönder
	if err := utils.SendVerificationEmail(user.Email, verificationToken); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Doğrulama e-postası gönderilemedi"})
		return
	}

	c.JSON(http.StatusCreated, gin.H{"message": "Kayıt başarılı, lütfen e-postanızı doğrulayın"})
}

// Login: Kullanıcı giriş işlemi
func Login(c *gin.Context) {
	var input struct {
		Email      string `json:"email" binding:"required,email"`
		Password   string `json:"password" binding:"required"`
		RememberMe bool   `json:"rememberMe"`
	}

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	var user models.User
	if err := config.DB.Where("email = ?", input.Email).First(&user).Error; err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Geçersiz giriş bilgileri"})
		return
	}

	if !utils.CheckPasswordHash(input.Password, user.Password) {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Geçersiz giriş bilgileri"})
		return
	}

	if !user.IsVerified {
		now := time.Now()
		shouldSend := false

		// Daha önce hiç gönderilmemişse veya 10 dakikadan uzun süre geçmişse
		if user.VerificationEmailSentAt == nil || now.Sub(*user.VerificationEmailSentAt) > 10*time.Minute {
			shouldSend = true
		}

		if shouldSend {
			// Yeni token oluştur
			newToken, err := utils.GenerateVerificationToken()
			if err != nil {
				c.JSON(http.StatusInternalServerError, gin.H{"error": "Yeni doğrulama token'ı oluşturulamadı"})
				return
			}

			user.VerificationToken = newToken
			user.VerificationEmailSentAt = &now

			if err := config.DB.Save(&user).Error; err != nil {
				c.JSON(http.StatusInternalServerError, gin.H{"error": "Token kaydedilemedi"})
				return
			}

			// Doğrulama e-postası gönder
			if err := utils.SendVerificationEmail(user.Email, newToken); err != nil {
				c.JSON(http.StatusInternalServerError, gin.H{"error": "Doğrulama e-postası gönderilemedi"})
				return
			}

			c.JSON(http.StatusUnauthorized, gin.H{
				"error": "Lütfen e-postanızı doğrulayın. Yeni doğrulama bağlantısı gönderildi.",
			})
			return
		}

		// 10 dakikalık bekleme süresi geçmedi
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Lütfen e-postanızı doğrulayın. Daha önce gönderilen bağlantıyı kullanabilirsiniz.",
		})
		return
	}

	token, err := utils.GenerateJWT(user.Email)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Token oluşturulamadı"})
		return
	}

	// Refresh token üret
	refreshToken, err := utils.GenerateRandomToken()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Refresh token oluşturulamadı"})
		return
	}

	user.RefreshToken = refreshToken
	expiry := time.Now().Add(90 * 24 * time.Hour) // 90 gün geçerli
	user.RefreshTokenExpiry = &expiry
	if err := config.DB.Save(&user).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Refresh token kaydedilemedi"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"token": token,
		"refresh_token": refreshToken})
}

func VerifyEmail(c *gin.Context) {
	token := c.Query("token")
	if token == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Token eksik"})
		return
	}

	var user models.User
	if err := config.DB.Where("verification_token = ?", token).First(&user).Error; err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Geçersiz token"})
		return
	}

	user.IsVerified = true
	user.VerificationToken = "" // token sıfırlanıyor
	config.DB.Save(&user)

	c.JSON(http.StatusOK, gin.H{"message": "E-posta başarıyla doğrulandı"})
}

func RefreshToken(c *gin.Context) {
	var input struct {
		RefreshToken string `json:"refresh_token"`
	}
	if err := c.ShouldBindJSON(&input); err != nil || input.RefreshToken == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Refresh token gerekli"})
		return
	}

	var user models.User
	if err := config.DB.Where("refresh_token = ?", input.RefreshToken).First(&user).Error; err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Geçersiz refresh token"})
		return
	}

	if time.Now().After(*user.RefreshTokenExpiry) {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Refresh token süresi dolmuş"})
		return
	}

	newAccessToken, err := utils.GenerateJWT(user.Email)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Token oluşturulamadı"})
		return
	}

	newRefreshToken, err := utils.GenerateRandomToken()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Refresh token oluşturulamadı"})
		return
	}

	user.RefreshToken = newRefreshToken
	expiry := time.Now().Add(7 * 24 * time.Hour)
	user.RefreshTokenExpiry = &expiry

	// Veritabanına kaydet
	if err := config.DB.Save(&user).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Refresh token kaydedilemedi"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"token":         newAccessToken,
		"refresh_token": newRefreshToken,
	})
}

func Logout(c *gin.Context) {
	// Token'dan e-posta adresini al
	userEmail, err := utils.ExtractEmailFromToken(c)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Geçersiz token"})
		return
	}

	// Kullanıcıyı bul
	var user models.User
	if err := config.DB.Where("email = ?", userEmail).First(&user).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Kullanıcı bulunamadı"})
		return
	}

	// Refresh token'ı sıfırla
	user.RefreshToken = ""
	user.RefreshTokenExpiry = nil
	if err := config.DB.Save(&user).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Çıkış yapılamadı"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Çıkış başarılı"})
}
