package audit

import "SCC_Backend/core"

func HandleGetAudit(ctx *core.WebContext) error {
	repo := NewRepository(ctx)
	playerId := 1

	audit, err := repo.GetAuditsFromPlayer(playerId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success(audit)
}

func HandleCreateAudit(ctx *core.WebContext) error {
	var car CreateAuditRequest
	playerId := 1

	err := ctx.Bind(&car)
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
