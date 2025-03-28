package api

import (
	"SCC_Backend/core"
	"github.com/golang-jwt/jwt"
	"time"
)

type PlayerClaims struct {
	PlayerId int `json:"playerId"`
	jwt.StandardClaims
}

type GameClaims struct {
	GameId   int `json:"gameId"`
	PlayerId int `json:"playerId"`
	jwt.StandardClaims
}

func GenerateAuthToken(playerId int, config *core.Config) (string, error) {
	claims := &PlayerClaims{
		PlayerId: playerId,
		StandardClaims: jwt.StandardClaims{
			IssuedAt:  time.Now().Unix(),
			ExpiresAt: time.Now().Add(time.Hour * 24).Unix(),
		},
	}

	token, err := signToken(claims, config)
	if err != nil {
		return "", err
	}

	return token, nil
}

func DecodeAuthToken(token string, ctx *core.WebContext) (int, error) {
	claims := PlayerClaims{}

	_, err := jwt.ParseWithClaims(token, &claims, func(token *jwt.Token) (interface{}, error) {
		return ctx.GetConfig().JwtSecretKey, nil
	})

	if err != nil {
		return 0, err
	}

	return claims.PlayerId, nil
}

func GenerateGameToken(gameId int, config *core.Config) (string, error) {
	claims := &GameClaims{
		GameId: gameId,
		StandardClaims: jwt.StandardClaims{
			IssuedAt:  time.Now().Unix(),
			ExpiresAt: time.Now().Add(time.Hour * 24).Unix(),
		},
	}

	token, err := signToken(claims, config)
	if err != nil {
		return "", err
	}

	return token, nil
}

func DecodeGameToken(token string, ctx *core.WebContext) (int, int, error) {
	claims := GameClaims{}

	_, err := jwt.ParseWithClaims(token, &claims, func(token *jwt.Token) (interface{}, error) {
		return ctx.GetConfig().JwtSecretKey, nil
	})

	if err != nil {
		return 0, 0, err
	}

	return claims.GameId, claims.PlayerId, nil
}

func signToken(claims jwt.Claims, config *core.Config) (string, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)

	signedToken, err := token.SignedString(config.JwtSecretKey)
	if err != nil {
		return "", err
	}

	return signedToken, nil
}
