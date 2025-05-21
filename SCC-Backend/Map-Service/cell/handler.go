package cell

import (
	"map-service/api"
	"map-service/core"
	"strconv"
)

func HandleGetGridCells(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	token, err := ctx.GetGameToken()
	if err != nil {
		return ctx.Unauthorized("no game token provided")
	}

	_, _, err = api.DecodeGameToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	cityIdString := ctx.Request().Header.Get("cityId")

	if cityIdString == "" {
		return ctx.BadRequest("Missing cityId parameter")
	}

	cityId, err := strconv.Atoi(cityIdString)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	cells, err := repo.GetCellsForGrid(cityId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success(cells)
}

func HandleUpdateCell(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	token, err := ctx.GetGameToken()
	if err != nil {
		return ctx.Unauthorized("no game token provided")
	}

	_, _, err = api.DecodeGameToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	var ucr Cell

	err = ctx.Bind(&ucr)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	err = repo.UpdateCell(ucr)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	//Todo: Broadcast the changes to other players
	//broadcastGridUpdate(&ucr)

	return ctx.Success("Update Grid")
}
