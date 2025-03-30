package game

import (
	"SCC_Backend/api"
	"SCC_Backend/core"
)

func HandleSearchGame(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	searchValue := ctx.Param("searchNameValue")

	token, err := ctx.GetAuthToken()
	if err != nil {
		return ctx.Unauthorized("no auth token provided")
	}

	_, err = api.DecodeAuthToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	games, err := repo.GetGameByName(searchValue)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success(games)
}

func HandleListGames(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	token, err := ctx.GetAuthToken()
	if err != nil {
		return ctx.Unauthorized("no auth token provided")
	}

	_, err = api.DecodeAuthToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	games, err := repo.ListGames()
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success(games)
}

func HandleCreateGame(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	token, err := ctx.GetAuthToken()
	if err != nil {
		return ctx.Unauthorized("no auth token provided")
	}

	playerId, err := api.DecodeAuthToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	var cgr CreateGameRequest

	err = ctx.Bind(&cgr)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	err = repo.CreateNewGame(cgr, playerId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success("Created Game")
}

func HandleUpdateGame(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	token, err := ctx.GetAuthToken()
	if err != nil {
		return ctx.Unauthorized("no auth token provided")
	}

	playerId, err := api.DecodeAuthToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	var ucr UpdateGameRequest

	err = ctx.Bind(&ucr)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	err = repo.UpdateGame(ucr, playerId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success("Update Game")
}

func HandleDeleteGame(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	token, err := ctx.GetAuthToken()
	if err != nil {
		return ctx.Unauthorized("no auth token provided")
	}

	playerId, err := api.DecodeAuthToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	var dgr DeleteGameRequest

	err = ctx.Bind(&dgr)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	err = repo.DeleteGame(dgr, playerId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success("Deleted Game")
}
