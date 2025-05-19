package npc

import (
	"encoding/json"
	"fmt"
	"math/rand/v2"
	"os"
	"simulation-service/api"
	"simulation-service/core"
)

func CreateNpc(ctx *core.WebContext) error {
	repo := NewRepository(ctx)

	token, err := ctx.GetGameToken()
	if err != nil {
		return ctx.Unauthorized("no game token provided")
	}

	_, _, err = api.DecodeGameToken(token, ctx)
	if err != nil {
		return ctx.Unauthorized(err.Error())
	}

	var cnr CreateNpcRequest

	err = ctx.Bind(&cnr)
	if err != nil {
		return ctx.InternalError(err.Error())
	}

	gender := GenerateGender()

	name := GenerateRandomName(gender)
	if name == nil {
		return ctx.InternalError("Fail to generate Name")
	}

	cnr.Name = *name
	cnr.Gender = &gender
	cnr.CurrentCellID = cnr.HomeCellID

	fmt.Println(cnr)

	err = repo.InsertNpc(cnr)
	if err != nil {
		return err
	}

	return ctx.Success(name)
}

func GenerateGender() string {
	idx := rand.IntN((2 - 1) + 1)

	if idx == 1 {
		return "male"
	}

	return "female"
}

func GenerateRandomName(gender string) *string {
	var names NameData

	jsonNameFile, err := os.Open("./npc/names.json")
	if err != nil {
		fmt.Println("Error opening file:", err)
		return nil
	}
	defer func(jsonNameFile *os.File) {
		err := jsonNameFile.Close()
		if err != nil {

		}
	}(jsonNameFile)

	decoder := json.NewDecoder(jsonNameFile)
	if err := decoder.Decode(&names); err != nil {
		fmt.Println("Error decoding JSON:", err)
		return nil
	}

	var firstName, lastName string

	switch gender {
	case "male":
		listLen := len(names.FirstNames.Male)
		idx := rand.IntN((listLen - 0) + 0)
		firstName = names.FirstNames.Male[idx]
	case "female":
		listLen := len(names.FirstNames.Female)
		idx := rand.IntN((listLen - 0) + 0)
		firstName = names.FirstNames.Female[idx]
	default:
		return nil
	}

	listLen := len(names.LastNames)
	idx := rand.IntN((listLen - 0) + 0)
	lastName = names.LastNames[idx]

	fullName := fmt.Sprintf("%s %s", firstName, lastName)
	return &fullName
}
