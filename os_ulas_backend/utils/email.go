package utils

import (
	"fmt"
	"net/smtp"
	"os"
)

// SendVerificationEmail e-posta adresine doğrulama linki gönderir
func SendVerificationEmail(toEmail string, token string) error {
	from := os.Getenv("EMAIL_USER")
	password := os.Getenv("EMAIL_PASS")
	host := os.Getenv("EMAIL_HOST")
	port := os.Getenv("EMAIL_PORT")

	auth := smtp.PlainAuth("", from, password, host)

	verifyLink := fmt.Sprintf("http://localhost:8080/user/verify-email?token=%s", token)

	message := []byte(fmt.Sprintf("To: %s\r\n"+
		"Subject: Email Doğrulama\r\n\r\n"+
		"Merhaba,\n\nLütfen e-posta adresinizi doğrulamak için aşağıdaki bağlantıya tıklayın:\n%s\n\nTeşekkürler!",
		toEmail, verifyLink))

	addr := host + ":" + port

	return smtp.SendMail(addr, auth, from, []string{toEmail}, message)
}

// SendSimpleEmail, verilen e-posta adresine subject ve body içeriğiyle mail gönderir
func SendSimpleEmail(toEmail, subject, body string) error {
	from := os.Getenv("EMAIL_USER")
	password := os.Getenv("EMAIL_PASS")
	host := os.Getenv("EMAIL_HOST")
	port := os.Getenv("EMAIL_PORT")

	auth := smtp.PlainAuth("", from, password, host)

	message := []byte(fmt.Sprintf("To: %s\r\n"+
		"Subject: %s\r\n\r\n"+
		"%s", toEmail, subject, body))

	addr := host + ":" + port

	return smtp.SendMail(addr, auth, from, []string{toEmail}, message)
}
