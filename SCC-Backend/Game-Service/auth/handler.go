package auth

import (
	"game-service/api"
	"game-service/core"
	"github.com/labstack/echo/v4"
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

	return ctx.Success(echo.Map{"token": token})
}

func JoinGame(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	authToken, err := ctx.GetAuthToken()
	if err != nil {
		return ctx.Unauthorized("no auth token provided")
	}

	playerId, err := api.DecodeAuthToken(authToken, ctx)
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

	if password != game.Password {
		return ctx.Unauthorized("password is false")
	}

	//err = bcrypt.CompareHashAndPassword([]byte(game.Password), []byte(password))
	//if err != nil {
	//	return ctx.Unauthorized("Password is false")
	//}

	token, err := api.GenerateGameToken(gameId, playerId, ctx.GetConfig())
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success(echo.Map{"token": token})
}

func ValidateAuthToken(ctx *core.WebContext) error {
	token := ctx.Request().Header.Get("authToken")
	if token == "" {
		return ctx.Unauthorized("no auth token provided")
	}

	_, err := api.DecodeAuthToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized("auth token invalid")
	}

	return ctx.Success()
}

func ValidateGameToken(ctx *core.WebContext) error {
	token := ctx.Request().Header.Get("gameToken")
	if token == "" {
		return ctx.Unauthorized("no game token provided")
	}

	_, _, err := api.DecodeGameToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized("auth token invalid")
	}

	return ctx.Success()
}
