using System.Collections.Generic;
using System.Threading.Tasks;
using Service;
using Service.Auth;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

namespace Ui
{
    public class MenuManager : MonoBehaviour
    {
        public static MenuManager Instance { get; private set; }

        public enum UiElement
        {
            Login,
            GameList,
            InGame,
        }

        [Header("UI Elements")] [SerializeField]
        private GameObject loginCanvas;

        [SerializeField] private GameObject joinGameCanvas;
        [SerializeField] private GameObject inGameCanvas;
        [SerializeField] private GameObject createGameCanvas;
        [SerializeField] private Button loginButton;
        [SerializeField] private TMP_InputField playerNameInput;
        [SerializeField] private TMP_InputField passwordInput;

        [Header("Game List")] [SerializeField] private Transform gameListContainer;
        [SerializeField] private GameObject gameEntryPrefab;
        [SerializeField] private TMP_InputField searchGameInput;
        [SerializeField] private Button openCreateGameButton;

        private AuthService _authService;
        private GameService _gameService;

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

            HideAllMenus();
        }

        private async void Start()
        {
            _authService = AuthService.Instance;
            _gameService = GameService.Instance;

            loginButton.onClick.AddListener(async () => await Login());
            openCreateGameButton.onClick.AddListener(OpenCreateGameCanvas);
            searchGameInput.onValueChanged.AddListener(async (value) => await OnSearchValueChanged(value));

            if (_authService.GetAuthToken() != "" && await _authService.ValidateAuthToken())
            {
                ChangeDisplayMenu(UiElement.GameList);
                await LoadGamesAfterLogin();
            }
            else
            {
                ChangeDisplayMenu(UiElement.Login);
            }

            createGameCanvas.SetActive(false);
        }

        private void OpenCreateGameCanvas()
        {
            createGameCanvas.SetActive(!createGameCanvas.activeSelf);
        }

        private async Task LoadGamesAfterLogin()
        {
            await _gameService.GetGameList();

            RerenderGameList();
        }

        private async Task OnSearchValueChanged(string value)
        {
            await _gameService.SearchGame(value);

            ClearItemList();
            RenderItems(_gameService.GameList);
        }

        private async Task Login()
        {
            if (_authService == null)
            {
                Debug.LogError("AuthService is not initialized!");
                return;
            }

            string username = playerNameInput.text;
            string password = passwordInput.text;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                Debug.LogError("Username or password is empty!");
                return;
            }

            var success = await _authService.Login(username, password);

            OnLoginResult(success);
        }

        private void OnLoginResult(bool success)
        {
            if (success)
            {
                Debug.Log("Login successful!");
                ChangeDisplayMenu(UiElement.GameList);
                _ = LoadGamesAfterLogin();
            }
            else
            {
                Debug.LogError("Login failed: Invalid credentials or network error");
            }
        }

        public void RerenderGameList()
        {
            ClearItemList();
            RenderItems(_gameService.GameList);
        }

        private void ClearItemList()
        {
            foreach (Transform child in gameListContainer)
            {
                if (child.gameObject != gameEntryPrefab)
                {
                    Destroy(child.gameObject);
                }
            }
        }

        private void RenderItems(List<Game> games)
        {
            if (games == null)
            {
                Debug.LogWarning("Trying to render null game list");
                return;
            }

            if (gameEntryPrefab == null || gameListContainer == null)
            {
                Debug.LogError("Missing required UI components");
                return;
            }

            foreach (var game in games)
            {
                var gameEntry = Instantiate(gameEntryPrefab, gameListContainer);
                gameEntry.SetActive(true);

                var gameEntryScript = gameEntry.GetComponent<GameListObject>();
                if (gameEntryScript != null)
                {
                    gameEntryScript.Setup(game);
                }
                else
                {
                    Debug.LogError("GameEntry script is missing from the prefab.");
                    Destroy(gameEntry);
                }
            }
        }

        public void ChangeDisplayMenu(UiElement uiElement)
        {
            HideAllMenus();

            switch (uiElement)
            {
                case UiElement.Login:
                    loginCanvas.SetActive(true);
                    break;
                case UiElement.GameList:
                    joinGameCanvas.SetActive(true);
                    break;
                case UiElement.InGame:
                    inGameCanvas.SetActive(true);
                    break;
                default:
                    loginCanvas.SetActive(true);
                    break;
            }
        }

        private void HideAllMenus()
        {
            loginCanvas.SetActive(false);
            joinGameCanvas.SetActive(false);
            inGameCanvas.SetActive(false);
        }
    }
}