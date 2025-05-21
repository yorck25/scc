package cell

import (
	"database/sql"
	"database/sql/driver"
	"encoding/json"
	"fmt"
)

type Resource int

const (
	Oil   Resource = iota
	Iron           = iota
	Water          = iota
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

type AvailableGoods map[string]int

func (a *AvailableGoods) Scan(value interface{}) error {
	bytes, ok := value.([]byte)
	if !ok {
		return fmt.Errorf("failed to scan AvailableGoods: type assertion to []byte failed")
	}
	return json.Unmarshal(bytes, a)
}

func (a AvailableGoods) Value() (driver.Value, error) {
	return json.Marshal(a)
}

type CellData struct {
	ZoneType              string         `json:"zoneType" db:"zone_type"`
	Population            int            `json:"population" db:"population"`
	Pollution             int            `json:"pollution" db:"pollution"`
	AvailableWorkers      int            `json:"availableWorkers" db:"available_workers"`
	AvailableGoods        AvailableGoods `json:"availableGoods" db:"available_goods"`
	IsPowered             bool           `json:"isPowered" db:"is_powered"`
	IsAdjacentToPowerline bool           `json:"isAdjacentToPowerline" db:"is_adjacent_to_powerline"`
}

type Cell struct {
	Coordinate
	CellData
	BuildingId int `json:"buildingId" db:"building_id"`
	CityId     int `json:"cityId" db:"city_id"`
}

type CellRequest struct {
	Coordinate
	CellData
	BuildingId sql.NullInt64 `json:"buildingId" db:"building_id"`
	CityId     int           `json:"cityId" db:"city_id"`
}

type UpdateCellRequest struct {
	Coordinate
	CellData
	BuildingId int `json:"buildingId" db:"building_id"`
}
