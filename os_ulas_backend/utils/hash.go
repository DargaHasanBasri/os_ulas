package utils

// Şifreleme (hashleme) işlemleri için kullanılan kütüphane
import "golang.org/x/crypto/bcrypt"

// HashPassword, verilen şifreyi bcrypt algoritmasıyla şifreler
// Güvenlik seviyesi için cost değeri 14 olarak ayarlanır
func HashPassword(password string) (string, error) {
	// Şifreyi []byte'a çevirip bcrypt ile hash'le
	bytes, err := bcrypt.GenerateFromPassword([]byte(password), 14)

	// Hash'lenmiş şifre string olarak döndürülür
	return string(bytes), err
}

// CheckPasswordHash, kullanıcının girdiği düz şifreyi hash'lenmiş şifreyle karşılaştırır
func CheckPasswordHash(password, hash string) bool {
	// Şifre karşılaştırması yapar
	err := bcrypt.CompareHashAndPassword([]byte(hash), []byte(password))

	// Şifre doğruysa err == nil olur ve true döner, aksi halde false
	return err == nil
}
