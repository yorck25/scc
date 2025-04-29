package grid

import (
	"SCC_Backend/api"
	"SCC_Backend/core"
	"strconv"
)

func HandleGetGridForCity(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	token, err := ctx.GetGameToken()
	if err != nil {
		return ctx.Unauthorized("no game token provided")
	}

	_, _, err = api.DecodeGameToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	cityIdString := ctx.Param("cityId")

	if cityIdString == "" {
		return ctx.BadRequest("Missing cityId parameter")
	}

	cityId, err := strconv.Atoi(cityIdString)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	grid, err := repo.GetGridForCity(cityId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success(grid)
}

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

func HandleCreateGridForCity(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	token, err := ctx.GetGameToken()
	if err != nil {
		return ctx.Unauthorized("no game token provided")
	}

	_, _, err = api.DecodeGameToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	var cgr CreateGridRequest

	err = ctx.Bind(&cgr)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	grid, err := repo.CreateGridForCity(cgr)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success(grid)
}

func HandleUpdateGrid(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	token, err := ctx.GetGameToken()
	if err != nil {
		return ctx.Unauthorized("no game token provided")
	}

	_, _, err = api.DecodeGameToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	var ugr UpdateGridRequest

	err = ctx.Bind(&ugr)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	err = repo.UpdateGrid(ugr)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	broadcastGridUpdate(&ugr)

	return ctx.Success("Update Grid")
}

func HandleDeleteGrid(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	token, err := ctx.GetGameToken()
	if err != nil {
		return ctx.Unauthorized("no game token provided")
	}

	_, _, err = api.DecodeGameToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	var dgr DeleteGridRequest

	err = ctx.Bind(&dgr)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	err = repo.DeleteGrid(dgr)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success("Deleted Grid")
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
