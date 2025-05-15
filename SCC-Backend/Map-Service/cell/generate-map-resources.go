package cell

import (
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
				AvailableGoods:        make(map[string]int),
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

	newCells, err := GenerateRandomFieldCluster(x, y, cells, oil)
	if err != nil {
		return err
	}

	newCells, err = GenerateRandomFieldCluster(x, y, cells, iron)
	if err != nil {
		return err
	}

	newCells, err = GenerateRandomFieldCluster(x, y, cells, water)
	if err != nil {
		return err
	}

	return ctx.Success(newCells)
}

func GenerateRandomFieldCluster(x int, y int, cells []Cell, goodsName Resource) ([]Cell, error) {
	var percentage = 0.25
	minClusterRadius := 1

	xBuffer := int(math.Round(float64(x) * percentage))
	yBuffer := int(math.Round(float64(y) * percentage))

	setSeedOfCluster := func(coordinate Coordinate, availableGoods int) {
		for i := range cells {
			if cells[i].X == coordinate.X && cells[i].Y == coordinate.Y {
				if cells[i].AvailableGoods == nil {
					cells[i].AvailableGoods = make(map[string]int)
				}

				cells[i].AvailableGoods[goodsName.ToString()] = availableGoods
			}
		}
	}

	xSeed := rand.IntN((x-xBuffer)-xBuffer) + xBuffer
	ySeed := rand.IntN((y-yBuffer)-yBuffer) + yBuffer

	originCoordinate := Coordinate{
		X: xSeed,
		Y: ySeed,
	}

	setSeedOfCluster(originCoordinate, rand.IntN(100-90)+90)

	var selectedCoordinates []Coordinate

	xMin := rand.IntN((x-xBuffer)-minClusterRadius) + minClusterRadius
	xMax := rand.IntN((x-xBuffer)-minClusterRadius) + minClusterRadius
	yMin := rand.IntN((y-yBuffer)-minClusterRadius) + minClusterRadius
	yMax := rand.IntN((y-yBuffer)-minClusterRadius) + minClusterRadius

	xMin = (originCoordinate.X - xMin) + 1
	xMax = originCoordinate.X + xMax
	yMin = (originCoordinate.Y - yMin) + 1
	yMax = originCoordinate.Y + yMax

	for i := xMin; i < xMax; i++ {
		for j := yMin; j < yMax; j++ {
			newCoordinate := Coordinate{
				X: i,
				Y: j,
			}

			if newCoordinate != originCoordinate {
				selectedCoordinates = append(selectedCoordinates, newCoordinate)
			}
		}
	}

	calcDistanceToOriginPos := func(coordinate Coordinate) int {
		disX := abs(coordinate.X - originCoordinate.X)
		disY := abs(coordinate.Y - originCoordinate.Y)

		return disX + disY
	}

	randomResource := func(distance int) int {
		maxResource := 90
		minResource := 45
		decayPerCell := 10

		base := maxResource - decayPerCell*distance
		if base < minResource {
			base = minResource
		}

		variation := 10
		minR := base - variation/2
		maxR := base + variation/2

		if minR < minResource {
			minR = minResource
		}
		if maxR > maxResource {
			maxR = maxResource
		}

		if maxR < minR {
			maxR = minR
		}

		return rand.IntN(maxR-minR+1) + minR
	}

	goodsMap := make(map[Coordinate]int)

	for _, coordinate := range selectedCoordinates {
		distance := calcDistanceToOriginPos(coordinate)
		resourceValue := randomResource(distance)

		goodsMap[coordinate] = resourceValue
		setSeedOfCluster(coordinate, resourceValue)
	}

	return cells, nil
}

func abs(value int) int {
	if value < 0 {
		return -value
	}
	return value
}
