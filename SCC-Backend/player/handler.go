package player

import "SCC_Backend/core"

func GetPlayer(ctx *core.WebContext) error {
	repo := NewRepository(ctx)
	userId := "771"

	news, err := repo.GetNews(userId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success(news)
}
