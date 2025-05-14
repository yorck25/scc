package cell

import (
	"fmt"
	"map-service/core"
	"math/rand/v2"
	"strconv"
)

func TestCreateCluster(ctx *core.WebContext) error {
	x, err := strconv.Atoi(ctx.Request().Header.Get("X"))
	y, err := strconv.Atoi(ctx.Request().Header.Get("Y"))
	if err != nil {
		return ctx.InternalError("")
	}

	var cells []Cell

	for w := 0; w < x; w++ {
		for h := 0; h < y; h++ {
			newCoordinate := Coordinate{
				X: w,
				Y: h,
			}

			newCellData := CellData{
				ZoneType:              "plane",
				Population:            0,
				Pollution:             0,
				AvailableWorkers:      0,
				AvailableGoods:        0,
				IsPowered:             false,
				IsAdjacentToPowerline: false,
			}

			newCell := Cell{
				Coordinate: newCoordinate,
				BuildingId: 0,
				CellData:   newCellData,
				CityId:     1,
			}

			cells = append(cells, newCell)
		}
	}

	GenerateRandomFieldCluster(x, y, cells)
	return ctx.Success(cells)
}

func GenerateRandomFieldCluster(x int, y int, cells []Cell) {
	fmt.Print(rand.IntN(x))
	fmt.Print(rand.IntN(y))
}
