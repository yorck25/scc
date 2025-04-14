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
    }

    public class GameCanvasManager : MonoBehaviour
    {
        public static GameCanvasManager Instance { get; private set; }
        
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
                HideAllCanvases();
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

        private void ShowGamePlayCanvas()
        {
            inGameCanvas.SetActive(true);
            
            if(_cityService.CurrentCity == null)
            {
                createCityCanvas.SetActive(true);
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
            }
        }
    }
}