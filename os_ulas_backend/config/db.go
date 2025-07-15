package config

import (
	// Loglama işlemleri için standart kütüphane
	"log"

	// Ortam (environment) değişkenlerini okumak için kullanılır
	"os"

	// .env dosyasını okumak için
	"github.com/joho/godotenv"

	// GORM için MySQL sürücüsü
	"gorm.io/driver/mysql"

	// GORM ORM kütüphanesi
	"gorm.io/gorm"
)

// DB, uygulama genelinde kullanılacak global veritabanı bağlantısı nesnesi
var DB *gorm.DB

// ConnectDatabase fonksiyonu, MySQL veritabanına bağlanır ve DB değişkenini ayarlar
func ConnectDatabase() {
	// .env dosyasını yükle
	// Bu dosya projede ortam (environment) değişkenlerini içerir
	err := godotenv.Load()

	// .env dosyası yoksa terminale uyarı yazar ama uygulama devam eder
	if err != nil {
		log.Println("Uyarı: .env dosyası yüklenemedi. Ortam değişkenlerinden okumaya çalışılıyor.")
	}

	// Ortam değişkenlerinden veritabanı yapılandırmalarını oku
	dbUser := os.Getenv("DB_USER")         // MySQL kullanıcı adı
	dbPassword := os.Getenv("DB_PASSWORD") // MySQL şifre
	dbHost := os.Getenv("DB_HOST")         // Sunucu adresi
	dbPort := os.Getenv("DB_PORT")         // Port numarası
	dbName := os.Getenv("DB_NAME")         // Veritabanı adı
	dbParams := os.Getenv("DB_PARAMS")     // MySQL bağlantı parametreleri

	// DSN (Data Source Name) stringini oluşturulur
	// Format: kullanıcı:şifre@tcp(host:port)/veritabani?parametreler
	// parseTime=True: zaman değerlerinin Go time.Time tipine parse edilmesini sağlar
	// loc=Local: zaman dilimi olarak lokal zamanı kullanır
	dsn := dbUser + ":" + dbPassword + "@tcp(" + dbHost + ":" + dbPort + ")/" + dbName + dbParams

	// GORM ile MySQL veritabanına bağlanmaya çalışıyoruz
	database, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		// Bağlantı hatası varsa programı durdur ve hata mesajını yazdır
		log.Fatal("Veritabanına bağlanırken hata oluştu: ", err)
	}

	// Bağlantı başarılı ise global DB değişkenine atıyoruz
	DB = database
}
