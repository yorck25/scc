package audit

import "SCC_Backend/core"

func HandlerGetAudit(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	audit, err := repo.GetAudit()
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success(audit)
}

func HandlerCreateAudit(ctx *core.WebContext) error {
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