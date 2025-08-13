package models

import (
	// UUID oluşturmak için google'un uuid paketi kullanılır
	"os_ulas_backend/config"

	"github.com/google/uuid"
	"golang.org/x/crypto/bcrypt"

	// GORM ORM kütüphanesi (Go ORM) mysql işlemleri için
	"gorm.io/gorm"

	// Zaman işlemleri için standart Go paketi
	"time"
)

type User struct {
	// Kullanıcının benzersiz kimliği (UUID tipinde)
	// GORM için char(36) tipinde ve primary key olarak tanımlı
	// JSON'da "id" olarak görünür
	ID uuid.UUID `gorm:"type:char(36);primaryKey" json:"id"`

	// Kullanıcının adı
	// JSON'da "name" olarak görünür
	Name string `json:"name"`

	// Kullanıcının email adresi
	// GORM tarafında "unique" constraint ile benzersiz olmalı
	// JSON'da "email" olarak görünecek
	Email string `json:"email" gorm:"unique"`

	// Kullanıcının şifresi
	// JSON çıktısında görünmemesi için `json:"-"` kullanıldı (gizli tutuluyor)
	Password string `json:"-"`

	// Kayıt oluşturulma zamanı
	// JSON'da "created_at" olarak görünecek
	CreatedAt time.Time `json:"created_at"`

	// Kayıt güncellenme zamanı
	// JSON'da "updated_at" olarak görünecek
	UpdatedAt time.Time `json:"updated_at"`

	IsVerified        bool   `json:"is_verified" gorm:"default:false"`
	VerificationToken string `json:"-"` // JSON'da gösterilmesin

	RefreshToken            string     `json:"-"` // JSON'da gözükmesin
	RefreshTokenExpiry      *time.Time `gorm:"column:refresh_token_expiry" json:"refresh_token_expiry"`
	VerificationEmailSentAt *time.Time `gorm:"column:verification_email_sent_at" json:"verification_email_sent_at"`
}

// BeforeCreate GORM hook'u
// Yeni bir kullanıcı oluşturulmadan önce çalışır
// UUID oluşturup ID alanına otomatik olarak set eder
func (user *User) BeforeCreate(tx *gorm.DB) (err error) {
	user.ID = uuid.New()

	// Şifre hashle
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(user.Password), bcrypt.DefaultCost)
	if err != nil {
		return err
	}
	user.Password = string(hashedPassword)

	return nil
}

func GetUserByEmail(email string) (*User, error) {
	var user User
	err := config.DB.Where("email = ?", email).First(&user).Error
	if err != nil {
		return nil, err
	}
	return &user, nil
}

func UpdatePasswordByEmail(email, hashedPassword string) error {
	return config.DB.Model(&User{}).Where("email = ?", email).Update("password", hashedPassword).Error
}
