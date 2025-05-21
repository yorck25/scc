package grid

import (
	"map-service/api"
	"map-service/cell"
	"map-service/core"
	"strconv"
)

func HandleGetGridForCity(ctx *core.WebContext) error {
	repo := NewRepository(ctx)
	cellRepo := cell.NewRepository(ctx)

	token, err := ctx.GetGameToken()
	if err != nil {
		return ctx.Unauthorized("no game token provided")
	}

	_, _, err = api.DecodeGameToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	cityId, err := strconv.Atoi(ctx.Request().Header.Get("cityId"))

	if err != nil {
		return ctx.BadRequest("Missing cityId parameter or cityId is not a number")
	}

	grid, err := repo.GetGridForCity(cityId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	cells, err := cellRepo.GetCellsForGrid(cityId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	grid.Cells = cells

	return ctx.Success(grid)
}

func HandleCreateGridForCity(ctx *core.WebContext) error {
	repo := NewRepository(ctx)
	cellRepo := cell.NewRepository(ctx)

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

	var successCount = 0

	for _, newCell := range grid.Cells {
		err := cellRepo.CreateCell(newCell)
		if err != nil {
			return err
		}
		successCount++
	}

	if successCount != len(grid.Cells) {
		return ctx.InternalError("Error while creating the cells.")
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
	cellRepo := cell.NewRepository(ctx)

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

	err = cellRepo.DeleteCellForGrid(dgr.CityId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	err = repo.DeleteGrid(dgr)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success("Deleted Grid")
}
