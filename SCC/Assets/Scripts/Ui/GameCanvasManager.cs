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

            HideAllCanvases();
        }

        private void Start()
        {
            _gameService = GameService.Instance;
            _cityService = CityService.Instance;
            leaveButton.onClick.AddListener(() => OnLeaveButtonClick());
            toggleBuildModeButton.onClick.AddListener(() => OnToggleBuildButtonClick());
            openCreateCityButton.onClick.AddListener(() => OnOpenCreateCityMenu());

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
            if (await _gameService.LeaveGame())
            {
                HideAllCanvases();
                MenuManager.Instance.ChangeDisplayMenu(MenuManager.UiElement.GameList);
            }
        }

        private void OnOpenCreateCityMenu()
        {
            ChangeDisplayedCanvas(InGameUiElement.CreateCity);
        }

        private async void OnCreateCitySubmit()
        {
            var cityName = createCityNameInput.text;

            if (await _cityService.CreateCity(cityName))
            {
                createCityNameInput.text = "";
                ChangeDisplayedCanvas(InGameUiElement.GamePlay);
            }
        }

        private void HideAllCanvases()
        {
            inGameCanvas.SetActive(false);
            cityListCanvas.SetActive(false);
            createCityCanvas.SetActive(false);
        }

        private void ShowGamePlayCanvas()
        {
            inGameCanvas.SetActive(true);

            if (_cityService.CurrentCity == null)
            {
                createCityCanvas.SetActive(true);
            }
        }

        private async Task ShowCityListCanvas()
        {
            cityListCanvas.SetActive(true);
            await _cityService.LoadCitiesForGame();
            RenderCityList();
        }

        public void RenderCityList()
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

        public void ChangeDisplayedCanvas(InGameUiElement uiElement)
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
                    ShowCityListCanvas();
                    break;
            }
        }
    }
}