using System;
using Service;
using TMPro;
using Ui;
using UnityEngine;
using UnityEngine.UI;

namespace Ui
{
    public enum InGameUiElement
    {
        CreateCity,
        GamePlay,
    }

    public class GameCanvas : MonoBehaviour
    {
        [Header("In Game Canvases")] 
        [SerializeField] private GameObject createCityCanvas;
        [SerializeField] private GameObject inGameCanvas;

        [Header("In Game Ui-Elements")] 
        [SerializeField] private Button leaveButton;
        [SerializeField] private Button toggleBuildModeButton;
        [SerializeField] private TextMeshProUGUI cityNameText;
        [SerializeField] private TextMeshProUGUI gameNameText;

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

        private void Update()
        {
            if (_gameService.CurrentGame != null)
            {
                gameNameText.text = _gameService.CurrentGame.name;
            }

            if (_cityService.CurrentCity != null)
            {
                cityNameText.text = _cityService.CurrentCity.name;
            }
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
            Debug.Log("Try to create city");
            var cityName = createCityNameInput.text;

            if (await _cityService.CreateCity(cityName))
            {
                Debug.Log("hide menu");
                createCityNameInput.text = "";
                ChangeDisplayedCanvas(InGameUiElement.GamePlay);
            }
        }

        private void HideAllCanvases()
        {
            inGameCanvas.SetActive(false);
            createCityCanvas.SetActive(false);
        }

        public void ChangeDisplayedCanvas(InGameUiElement uiElement)
        {
            HideAllCanvases();

            switch (uiElement)
            {
                case InGameUiElement.GamePlay:
                    Debug.Log("hide menu");
                    inGameCanvas.SetActive(true);
                    break;
                case InGameUiElement.CreateCity:
                    Debug.Log("show menu");
                    createCityCanvas.SetActive(true);
                    break;
                default:
                    inGameCanvas.SetActive(true);
                    break;
            }
        }
    }
}