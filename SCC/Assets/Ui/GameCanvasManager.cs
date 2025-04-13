using Service;
using TMPro;
using Ui;
using UnityEngine;
using UnityEngine.UI;

public class GameCanvas : MonoBehaviour
{
    [Header("In Game Ui-Elements")] 
    [SerializeField] private Button leaveButton;
    [SerializeField] private Button toggleBuildModeButton;

    [Header("Create City Elements")] 
    [SerializeField] private TMP_InputField createCityNameInput;
    [SerializeField] private Button submitCreateGameButton;

    private GameService _gameService;
    private CityService _cityService;

    private void Start()
    {
        _gameService = GameService.Instance;
        _cityService = CityService.Instance;
        leaveButton.onClick.AddListener(() => OnLeaveButtonClick());
        toggleBuildModeButton.onClick.AddListener(() => OnToggleBuildButtonClick());
        
        submitCreateGameButton.onClick.AddListener(() => OnCreateCitySubmit());
    }

    private void OnToggleBuildButtonClick()
    {
        _gameService.ToggleBuildMode();
    }

    private async void OnLeaveButtonClick()
    {
        Debug.Log("start leave process");

        if (await _gameService.LeaveGame())
        {
            MenuManager.Instance.ChangeDisplayMenu(MenuManager.UiElement.GameList);
        }
    }

    private async void OnCreateCitySubmit()
    {
        var cityName = createCityNameInput.text;

        if (await _cityService.CreateCity(cityName))
        {
            createCityNameInput.text = "";
            MenuManager.Instance.ChangeDisplayMenu(MenuManager.UiElement.GameList);
        }
    }
}