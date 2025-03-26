package audit

import (
	"encoding/json"
)

type Audit struct {
	Id       int64           `db:"id" json:"id"`
	PlayerId int64           `db:"player_id" json:"playerId"`
	Action   string          `db:"action" json:"action"`
	OldValue json.RawMessage `db:"old_value" json:"oldValue"`
	NewValue json.RawMessage `db:"new_value" json:"newValue"`
}
