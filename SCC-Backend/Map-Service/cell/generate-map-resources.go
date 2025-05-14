package cell

import (
	"fmt"
	"map-service/core"
	"math"
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

	newCells, err := GenerateRandomFieldCluster(x, y, cells)
	if err != nil {
		return err
	}

	return ctx.Success(newCells)
}

func GenerateRandomFieldCluster(x int, y int, cells []Cell) ([]Cell, error) {
	var percentage = 0.25
	minClusterRadius := 1
	//spreadChance := 0.6

	xBuffer := int(math.Round(float64(x) * percentage))
	yBuffer := int(math.Round(float64(y) * percentage))

	setSeedOfCluster := func(coordinate Coordinate) {
		for i := range cells {
			if cells[i].X == coordinate.X && cells[i].Y == coordinate.Y {
				cells[i].AvailableGoods = 1
			}
		}
	}

	//defines the cluster origin seed
	xSeed := rand.IntN((x-xBuffer)-xBuffer) + xBuffer
	ySeed := rand.IntN((y-yBuffer)-yBuffer) + yBuffer

	originCoordinate := Coordinate{
		X: xSeed,
		Y: ySeed,
	}

	setSeedOfCluster(originCoordinate)

	var selectedCoordinates []Coordinate

	xMin := rand.IntN((x-xBuffer)-minClusterRadius) + minClusterRadius
	xMax := rand.IntN((x-xBuffer)-minClusterRadius) + minClusterRadius

	yMin := rand.IntN((y-yBuffer)-minClusterRadius) + minClusterRadius
	yMax := rand.IntN((y-yBuffer)-minClusterRadius) + minClusterRadius

	xMin = (originCoordinate.X - xMin) + 1
	xMax = (originCoordinate.X + xMax)

	yMin = (originCoordinate.Y - yMin) + 1
	yMax = (originCoordinate.Y + yMax)

	//fmt.Printf("xMin=%d, xMax=%d | yMin=%d, yMax=%d\n", xMin, xMax, yMin, yMax)

	for i := xMin; i < xMax; i++ {
		for j := yMin; j < yMax; j++ {
			newCoordinate := Coordinate{
				X: i,
				Y: j,
			}

			if newCoordinate != originCoordinate {
				selectedCoordinates = append(selectedCoordinates, newCoordinate)
			} else {
				fmt.Println("skipping origin coordinate")
			}
		}
	}

	for _, coordinate := range selectedCoordinates {
		setSeedOfCluster(coordinate)
	}

	return cells, nil
}
