package audit

import (
	"game-service/api"
	"game-service/core"
)

func HandleGetAudit(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	token, err := ctx.GetAuthToken()
	if err != nil {
		return ctx.Unauthorized("no auth token provided")
	}

	playerId, err := api.DecodeAuthToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	audit, err := repo.GetAuditsFromPlayer(playerId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success(audit)
}

func HandleCreateAudit(ctx *core.WebContext) error {
	var car CreateAuditRequest

	token, err := ctx.GetAuthToken()
	if err != nil {
		return ctx.Unauthorized("no auth token provided")
	}

	playerId, err := api.DecodeAuthToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	err = ctx.Bind(&car)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	repo := NewRepository(ctx)

	err = repo.CreateNewAudit(car, playerId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success("Create audit")
}
