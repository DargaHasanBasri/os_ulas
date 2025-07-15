package main

import (
	"log"
	"os_ulas_backend/config"
	"os_ulas_backend/routes"

	"github.com/joho/godotenv"
)

func main() {
	// .env dosyasını yükle, hata varsa logla ama uygulamayı durdurma
	err := godotenv.Load()
	if err != nil {
		log.Println("Uyarı: .env dosyası yüklenemedi. Ortam değişkenleri kullanılabilir olabilir.")
	}

	// Veritabanı bağlantısını kur
	config.ConnectDatabase()
	// Model yapısını veritabanında oluştur / güncelle
	err = config.DB.AutoMigrate()

	if err != nil {
		log.Fatalf("Veritabanı otomatik migrasyonu başarısız oldu: %v", err)
	}

	// Gin router'ı başlat
	r := routes.SetupRouter()

	// HTTP server'ı 8080 portunda başlat
	r.Run(":8080")
}
