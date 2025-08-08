package utils

import (
	"crypto/rand"
	"encoding/hex"
	"errors"
	"os"
	"strings"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v5"
)

// .env dosyasından okunan JWT secret key
var jwtKey = []byte(os.Getenv("JWT_SECRET"))

// GenerateJWT, verilen e-posta için JWT token üretir
func GenerateJWT(email string) (string, error) {
	claims := jwt.MapClaims{}
	claims["authorized"] = true
	claims["email"] = email

	// Token süresini belirle
	var expiration = time.Hour * 24 // 1 gün

	claims["exp"] = time.Now().Add(expiration).Unix()

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString(jwtKey)
}

// Token içinden email bilgisini çıkarır
func ExtractEmailFromToken(c *gin.Context) (string, error) {
	authHeader := c.GetHeader("Authorization")
	if authHeader == "" {
		return "", errors.New("authorization header yok")
	}

	parts := strings.Split(authHeader, " ")
	if len(parts) != 2 || parts[0] != "Bearer" {
		return "", errors.New("bearer token formatı hatalı")
	}

	tokenStr := parts[1]
	token, err := jwt.Parse(tokenStr, func(token *jwt.Token) (interface{}, error) {
		return jwtKey, nil
	})

	if claims, ok := token.Claims.(jwt.MapClaims); ok && token.Valid {
		email, _ := claims["email"].(string)
		return email, nil
	}

	return "", err
}

// Rastgele token üret (şifre sıfırlama gibi yerlerde kullanılır)
func GenerateRandomToken() (string, error) {
	b := make([]byte, 16)
	_, err := rand.Read(b)
	return hex.EncodeToString(b), err
}

// Doğrulama token'ı üretir (rastgele 32 karakterlik hex string)
func GenerateVerificationToken() (string, error) {
	bytes := make([]byte, 16) // 16 byte = 32 hex karakter
	_, err := rand.Read(bytes)
	if err != nil {
		return "", err
	}
	return hex.EncodeToString(bytes), nil
}

// ParseJWT token içinden email bilgisini döner
func ParseJWT(tokenString string) (string, error) {
	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		return jwtKey, nil
	})

	if err != nil {
		return "", err
	}

	if claims, ok := token.Claims.(jwt.MapClaims); ok && token.Valid {
		email, _ := claims["email"].(string)
		return email, nil
	}

	return "", errors.New("geçersiz token veya email bulunamadı")
}
