package city

import (
	"SCC_Backend/api"
	"SCC_Backend/core"
	"strconv"
)

func HandleGetAllCitiesForGame(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	token, err := ctx.GetGameToken()
	if err != nil {
		return ctx.Unauthorized("no game token provided")
	}

	tokenGameId, _, err := api.DecodeGameToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	gameIdString := ctx.Param("gameId")

	if gameIdString == "" {
		return ctx.BadRequest("Missing gameId parameter")
	}

	gameId, err := strconv.Atoi(gameIdString)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	if gameId != tokenGameId {
		return ctx.Unauthorized("")
	}

	cities, err := repo.GetAllCitiesForGame(gameId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success(cities)
}

func HandleGetCityByName(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	token, err := ctx.GetGameToken()
	if err != nil {
		return ctx.Unauthorized("no game token provided")
	}

	tokenGameId, _, err := api.DecodeGameToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	gameIdString := ctx.Param("gameId")

	if gameIdString == "" {
		return ctx.BadRequest("Missing gameId parameter")
	}

	name := ctx.Param("name")

	if name == "" {
		return ctx.BadRequest("Missing name parameter")
	}

	gameId, err := strconv.Atoi(gameIdString)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	if gameId != tokenGameId {
		return ctx.Unauthorized("")
	}

	cities, err := repo.GetCityByName(gameId, name)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success(cities)
}

func HandleCreateCity(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	token, err := ctx.GetGameToken()
	if err != nil {
		return ctx.Unauthorized("no game token provided")
	}

	_, playerId, err := api.DecodeGameToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	var ccr CreateCityRequest

	err = ctx.Bind(&ccr)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	city, err := repo.CreateNewCity(ccr, playerId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success(city)
}

func HandleUpdateCity(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	token, err := ctx.GetGameToken()
	if err != nil {
		return ctx.Unauthorized("no game token provided")
	}

	_, playerId, err := api.DecodeGameToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	var ucr UpdateCityRequest

	err = ctx.Bind(&ucr)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	err = repo.UpdateCity(ucr, playerId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success("Update Gity")
}

func HandleDeleteCity(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	token, err := ctx.GetGameToken()
	if err != nil {
		return ctx.Unauthorized("no game token provided")
	}

	_, playerId, err := api.DecodeGameToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	var dcr DeleteCityRequest

	err = ctx.Bind(&dcr)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	err = repo.DeleteCity(dcr, playerId)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	return ctx.Success("Deleted City")
}
