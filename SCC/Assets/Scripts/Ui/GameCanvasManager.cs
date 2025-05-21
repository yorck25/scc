using System.Collections.Generic;
using System.Threading.Tasks;
using Service;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Ui
{
    public enum InGameUiElement
    {
        CreateCity,
        GamePlay,
        CityList,
    }

    public class GameCanvasManager : MonoBehaviour
    {
        public static GameCanvasManager Instance { get; private set; }

        [Header("In Game Canvases")] 
        [SerializeField] private GameObject createCityCanvas;
        [SerializeField] private GameObject inGameCanvas;
        [SerializeField] private GameObject cityListCanvas;

        [Header("In Game Ui-Elements")] 
        [SerializeField] private Button leaveButton;
        [SerializeField] private Button toggleBuildModeButton;
        [SerializeField] private TextMeshProUGUI cityNameText;
        [SerializeField] private TextMeshProUGUI gameNameText;

        [Header("Create City Elements")] 
        [SerializeField] private TMP_InputField createCityNameInput;
        [SerializeField] private Button submitCreateGameButton;

        [Header("City List Elements")] 
        [SerializeField] private Transform cityListContainer;
        [SerializeField] private GameObject gameEntryPrefab;
        [SerializeField] private Button openCreateCityButton;

        private GameService _gameService;
        private CityService _cityService;
        private GridService _gridService;
        private CellService _cellService;

        private void Awake()
        {
            if (Instance == null)
            {
                Instance = this;
            }
            else
            {
                Destroy(gameObject);
            }
            
            _gameService = GameService.Instance;
            _cityService = CityService.Instance;
            _gridService = GridService.Instance;
            _cellService = CellService.Instance;

            HideAllCanvases();
        }

        private void Start()
        {
            leaveButton.onClick.AddListener(async () => await OnLeaveButtonClick());
            toggleBuildModeButton.onClick.AddListener(() => OnToggleBuildButtonClick());
            openCreateCityButton.onClick.AddListener(async () => await OnOpenCreateCityMenu());
            submitCreateGameButton.onClick.AddListener(async () => await OnCreateCitySubmit());
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

        private async Task OnLeaveButtonClick()
        {
            if (await _gameService.LeaveGame())
            {
                HideAllCanvases();
                MenuManager.Instance.ChangeDisplayMenu(MenuManager.UiElement.GameList);
            }
        }

        private async Task OnOpenCreateCityMenu()
        {
            await ChangeDisplayedCanvas(InGameUiElement.CreateCity);
        }

        private async Task OnCreateCitySubmit()
        {
            var cityName = createCityNameInput.text;

            if (await _cityService.CreateCity(cityName))
            {
                if (!await _gridService.CreateGrid(_cityService.CurrentCity.cityId))
                {
                    return;
                }
                
                if (await _cellService.AddResourceToGrid(_cityService.CurrentCity.cityId))
                {
                    GridSystem.Instance.RenderLoadedGrid(_gridService.CurrentGrid);
                }
                
                createCityNameInput.text = "";
                await ChangeDisplayedCanvas(InGameUiElement.GamePlay);
            }
        }

        private void HideAllCanvases()
        {
            inGameCanvas.SetActive(false);
            cityListCanvas.SetActive(false);
            createCityCanvas.SetActive(false);
        }

        private async void ShowGamePlayCanvas()
        {
            if (_cityService.CurrentCity == null)
            {
                createCityCanvas.SetActive(true);
            }
            else
            {
                Debug.Log("Load gird after game gets displayed");
                inGameCanvas.SetActive(true);
                if (await _gridService.LoadGrid(_cityService.CurrentCity.cityId))
                {
                    GridSystem.Instance.RenderLoadedGrid(_gridService.CurrentGrid);
                }
            }
        }

        private async Task ShowCityListCanvas()
        {
            cityListCanvas.SetActive(true);
            await _cityService.LoadCitiesForGame();
            RenderCityList();
        }

        private void RenderCityList()
        {
            ClearItemList();
            RenderItems(_cityService.CityList);
        }

        private void ClearItemList()
        {
            foreach (Transform child in cityListContainer)
            {
                if (child.gameObject != gameEntryPrefab)
                {
                    Destroy(child.gameObject);
                }
            }
        }

        private void RenderItems(List<City> cities)
        {
            if (cities == null)
            {
                return;
            }
            
            if (gameEntryPrefab == null || cityListContainer == null)
            {
                Debug.LogError("Missing required UI components");
                return;
            }

            foreach (var city in cities)
            {
                var gameEntry = Instantiate(gameEntryPrefab, cityListContainer);
                gameEntry.SetActive(true);
                
                var cityEntryScript = gameEntry.GetComponentInChildren<CityListObject>();
                if (cityEntryScript != null)
                {
                    cityEntryScript.Setup(city);
                }
                else
                {
                    Debug.LogError("CityListObject script is missing from the instantiated prefab.");
                    Destroy(gameEntry);
                }
            }
        }

        public async Task ChangeDisplayedCanvas(InGameUiElement uiElement)
        {
            HideAllCanvases();

            switch (uiElement)
            {
                case InGameUiElement.GamePlay:
                    ShowGamePlayCanvas();
                    break;
                case InGameUiElement.CreateCity:
                    createCityCanvas.SetActive(true);
                    break;
                case InGameUiElement.CityList:
                    await ShowCityListCanvas();
                    break;
            }
        }
    }
}