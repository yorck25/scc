package cell

import "database/sql"

type Resource int

const (
	oil   Resource = iota
	iron           = iota
	water          = iota
)

func (r Resource) ToString() string {
	names := [...]string{"oil", "iron", "water"}
	if int(r) < 0 || int(r) >= len(names) {
		return "unknown"
	}
	return names[r]
}

func (r Resource) EnumIndex() int {
	return int(r)
}

type Coordinate struct {
	X int `json:"x" db:"x"`
	Y int `json:"y" db:"y"`
}

type CellData struct {
	ZoneType              string         `json:"zoneType" db:"zone_type"`
	Population            int            `json:"population" db:"population"`
	Pollution             int            `json:"pollution" db:"pollution"`
	AvailableWorkers      int            `json:"availableWorkers" db:"available_workers"`
	AvailableGoods        map[string]int `json:"availableGoods" db:"available_goods"`
	IsPowered             bool           `json:"isPowered" db:"is_powered"`
	IsAdjacentToPowerline bool           `json:"isAdjacentToPowerline" db:"is_adjacent_to_powerline"`
}

type Cell struct {
	CellId int `json:"cellId" db:"cell_id"`
	Coordinate
	CellData
	BuildingId int `json:"buildingId" db:"building_id"`
	CityId     int `json:"cityId" db:"city_id"`
}

type CellRequest struct {
	CellId int `json:"cellId" db:"cell_id"`
	Coordinate
	CellData
	BuildingId sql.NullInt64 `json:"buildingId" db:"building_id"`
	CityId     int           `json:"cityId" db:"city_id"`
}

type UpdateCellRequest struct {
	CellId int `json:"cellId" db:"cell_id"`
	Coordinate
	CellData
	BuildingId int `json:"buildingId" db:"building_id"`
}
