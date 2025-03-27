package core

import (
	"os"

	"github.com/joho/godotenv"
)

type Config struct {
	JwtSecretKey []byte
}

func LoadConfig() (*Config, error) {
	config := &Config{}

	err := godotenv.Load()
	if err != nil {
		return nil, err
	}

	JwtSecretKey := os.Getenv("JWT_SECRET_KEY")
	if JwtSecretKey == "" {
		JwtSecretKey = "my-super-save-key"
		//return nil, errors.New("no jwt secret key")
	}

	config.JwtSecretKey = []byte(JwtSecretKey)

	return config, nil
}
