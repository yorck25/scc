using System.Collections;
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

        [SerializeField] private GameObject loginCanvas;
        [SerializeField] private GameObject joinGameCanvas;
        [SerializeField] private GameObject inGameCanvas;
        [SerializeField] private Button loginButton;
        [SerializeField] private TMP_InputField playerNameInput;
        [SerializeField] private TMP_InputField passwordInput;

        [SerializeField] private Transform gameListContainer;
        [SerializeField] private GameObject gameEntryPrefab;

        private AuthService _authService;
        private GameService _gameService;
        private AuditService _auditService;

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
        }

        private void Start()
        {
            _authService = AuthService.Instance;
            _auditService = AuditService.Instance;
            _gameService = GameService.Instance;
            loginButton.onClick.AddListener(() => StartCoroutine(Login()));

            ToggleLoginCanvas(true);
            ToggleJoinGameCanvas(false);
        }

        private IEnumerator Login()
        {
            if (_authService == null)
            {
                Debug.LogError("AuthService is not initialized!");
                yield break;
            }

            string username = playerNameInput.text;
            string password = passwordInput.text;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                Debug.LogError("Username or password is empty!");
                yield break;
            }

            Debug.Log("Logging in...");
            yield return StartCoroutine(_authService.Login(username, password, OnLoginResult));
        }

        private void OnLoginResult(bool success)
        {
            if (success)
            {
                Debug.Log("Login successful!");
                //StartCoroutine(_auditService.WriteAudit(action: "User logged in", oldValue: null, newValue: null));
                ToggleLoginCanvas(false);
                ToggleJoinGameCanvas(true);

                StartCoroutine(RenderGameList());
            }
            else
            {
                Debug.LogError("Login failed: No token received.");
            }
        }

        private IEnumerator RenderGameList()
        {
            Debug.Log("RenderGameList Started.");

            if (_gameService == null || gameEntryPrefab == null || gameListContainer == null)
            {
                Debug.LogError("needed services are missing");
                yield break;
            }

            yield return StartCoroutine(_gameService.GetGameList());

            if (_gameService.GameList == null || _gameService.GameList.Count == 0)
            {
                Debug.LogError("No games to map");
                yield break;
            }

            foreach (var game in _gameService.GameList)
            {
                var gameEntry = Instantiate(gameEntryPrefab, gameListContainer);
                var gameEntryScript = gameEntry.GetComponent<GameListObject>();
                if (gameEntryScript != null)
                {
                    gameEntryScript.Setup(game);
                }
                else
                {
                    Debug.LogError("GameEntry script is missing from the prefab.");
                }
            }
        }

        public void ChangeDisplayMenu(UiElement uiElement)
        {
            HideAllMenus();

            switch (uiElement)
            {
                case UiElement.Login:
                    ToggleLoginCanvas(true);
                    break;
                case UiElement.GameList:
                    ToggleJoinGameCanvas(true);
                    break;
                case UiElement.InGame:
                    ToggleInGameCanvas(true);
                    break;
                default:
                    ToggleLoginCanvas(true);
                    break;
            }
        }

        private void HideAllMenus()
        {
            ToggleLoginCanvas(false);
            ToggleJoinGameCanvas(false);
            ToggleInGameCanvas(false);
        }

        private void ToggleJoinGameCanvas(bool state)
        {
            joinGameCanvas.SetActive(state);
        }

        private void ToggleLoginCanvas(bool state)
        {
            loginCanvas.SetActive(state);
        }

        private void ToggleInGameCanvas(bool state)
        {
            inGameCanvas.SetActive(state);
        }
    }
}