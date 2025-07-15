package routes

import (
	"github.com/gin-gonic/gin"
)

// SetupRouter, tüm API endpoint'lerini tanımlar ve router'ı döner
func SetupRouter() *gin.Engine {
	// Gin'in varsayılan router'ını oluştur (logger ve recovery middleware'leri aktif)
	r := gin.Default()
	return r
}
