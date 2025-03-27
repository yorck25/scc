package player

import "SCC_Backend/core"

func HandleGetPlayer(ctx *core.WebContext) error {
	repo := NewRepository(ctx)
	playerId := 1

	news, err := repo.GetPlayer(playerId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success(news)
}
