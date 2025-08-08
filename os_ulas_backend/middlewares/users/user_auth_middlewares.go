package middlewares

import (
	"net/http"
	"os_ulas_backend/utils"

	"github.com/gin-gonic/gin"
)

func AuthMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		_, err := utils.ExtractEmailFromToken(c)
		if err != nil {
			c.JSON(http.StatusUnauthorized, gin.H{"error": "Yetkisiz erişim"})
			c.Abort()
			return
		}
		c.Next()
	}
}
