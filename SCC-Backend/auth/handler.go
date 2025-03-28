package auth

import (
	"SCC_Backend/api"
	"SCC_Backend/core"
	"github.com/labstack/echo/v4"
	"golang.org/x/crypto/bcrypt"
	"strconv"
)

func Login(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	playerName := ctx.Request().Header.Get("playerName")
	password := ctx.Request().Header.Get("password")

	player, err := repo.GetPlayer(playerName)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	//temp while no registration process with pw hashing
	if password != player.Password {
		return ctx.Unauthorized("password is false")
	}

	//err = bcrypt.CompareHashAndPassword([]byte(player.Password), []byte(password))
	//if err != nil {
	//	return ctx.Unauthorized("password is false")
	//}

	token, err := api.GenerateAuthToken(player.Id, ctx.GetConfig())
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success(echo.Map{"authToken": token})
}

func JoinGame(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	authToken, err := ctx.GetAuthToken()
	if err != nil {
		return ctx.Unauthorized("no auth token provided")
	}

	_, err = api.DecodeAuthToken(authToken, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	gameIdString := ctx.Request().Header.Get("gameId")
	password := ctx.Request().Header.Get("password")

	gameId, err := strconv.Atoi(gameIdString)
	if err != nil {
		return ctx.BadRequest("game id is not a number")
	}

	game, err := repo.GetGame(gameId)
	if err != nil {
		return ctx.InternalError("No game with this params found")
	}

	err = bcrypt.CompareHashAndPassword([]byte(game.Password), []byte(password))
	if err != nil {
		return ctx.Unauthorized("Password is false")
	}

	token, err := api.GenerateGameToken(gameId, ctx.GetConfig())
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success(echo.Map{"gameToken": token})
}
