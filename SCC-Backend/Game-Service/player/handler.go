package player

import (
	"game-service/api"
	"game-service/core"
)

func HandleGetPlayer(ctx *core.WebContext) error {
	repo := NewRepository(ctx)
	token, err := ctx.GetAuthToken()
	if err != nil {
		return ctx.Unauthorized("no auth token provided")
	}

	playerId, err := api.DecodeAuthToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	news, err := repo.GetPlayer(playerId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success(news)
}
