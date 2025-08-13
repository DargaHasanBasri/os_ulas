package routes

import (
	handlers "os_ulas_backend/handlers/users"       // Kullanıcıya ait handler fonksiyonları (iş mantığı)
	middlewares "os_ulas_backend/middlewares/users" // Kullanıcıya özel middleware'ler (örnek: Auth kontrolü)

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin" // Gin web framework
)

// SetupRouter, tüm API endpoint'lerini tanımlar ve router'ı döner
func SetupRouter() *gin.Engine {
	// Gin'in varsayılan router'ını oluşturur (logger ve recovery middleware'leri aktif)
	r := gin.Default()

	r.Use(cors.New(cors.Config{
		AllowAllOrigins:  true, // Geliştirme için tüm origin'lere izin ver
		AllowMethods:     []string{"GET", "POST", "PUT", "DELETE", "OPTIONS", "PATCH"},
		AllowHeaders:     []string{"*"}, // Tüm header'lara izin ver
		AllowCredentials: false,         // AllowAllOrigins true olduğunda false olmalı
	}))

	// Kullanıcı işlemlerini gruplayan bir route grubu oluşturulur
	userGroup := r.Group("/user") // Tüm yollar /user ile başlayacak (örnek: /user/login)
	{
		// Kullanıcı kaydı -> POST /user/register
		userGroup.POST("/register", handlers.Register)

		// Kullanıcı girişi -> POST /user/login
		userGroup.POST("/login", handlers.Login)

		// E-posta doğrulama linki -> GET /user/verify-email
		userGroup.GET("/verify-email", handlers.VerifyEmail)

		// Refresh token ile yeni access token alma -> POST /user/refresh-token
		userGroup.POST("/refresh-token", handlers.RefreshToken)

		// Kullanıcı çıkışı -> POST /user/logout (JWT doğrulaması gerekir)
		userGroup.POST("/logout", middlewares.AuthMiddleware(), handlers.Logout)

		// Şifre sıfırlamak için e-posta kodu gönderme -> POST /user/send-reset-code
		userGroup.POST("/send-reset-code", handlers.SendResetCode)

		// Kod ile şifre sıfırlama -> POST /user/reset-password
		userGroup.POST("/reset-password", handlers.ResetPasswordWithCode)

		// Tüm kullanıcıları listeleme -> GET /user/all
		userGroup.GET("/all", handlers.GetAllUsers)

		// ID ile tek kullanıcı bilgisi alma -> GET /user/:id
		userGroup.GET("/:id", handlers.GetUser)

		// E-posta adresini güncelleme -> PUT /user/update-email
		userGroup.PUT("/update-email", handlers.UpdateEmail)

		// Şifreyi güncelleme -> PUT /user/update-password
		userGroup.PUT("/update-password", handlers.UpdatePassword)

		// Hesap silme -> DELETE /user/delete-account
		userGroup.DELETE("/delete-account", handlers.DeleteAccount)
	}

	// Router nesnesi döndürülür
	return r
}
