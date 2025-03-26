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
