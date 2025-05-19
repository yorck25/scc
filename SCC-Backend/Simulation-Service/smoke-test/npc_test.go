package smoke_test

import (
	"simulation-service/npc"
	"strings"
	"testing"
)

func TestGenerateRandomName(t *testing.T) {
	testCases := map[string]bool{
		"male":   true,
		"female": true,
		"":       false,
		"other":  false,
	}

	for input, expectValid := range testCases {
		got := npc.GenerateRandomName(input)

		if expectValid {
			if got == nil {
				t.Errorf("Expected non-nil result for input '%s', but got nil", input)
			} else {
				parts := strings.Split(*got, " ")
				if len(parts) != 2 {
					t.Errorf("Expected full name format 'First Last', got: '%s'", *got)
				}
			}
		} else {
			if got != nil {
				t.Errorf("Expected nil result for invalid input '%s', but got: '%s'", input, *got)
			}
		}
	}
}
