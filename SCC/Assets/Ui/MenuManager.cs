using System.Collections;
using Service;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

namespace Ui
{
    public class MenuManager : MonoBehaviour
    {
        public static MenuManager Instance { get; private set; }

        [SerializeField] private GameObject loginCanvas;
        [SerializeField] public GameObject joinGameCanvas;
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
            loginButton.onClick.AddListener(() => StartCoroutine(Login()));
            _authService = AuthService.Instance;
            _auditService = AuditService.Instance;
            _gameService = GameService.Instance;

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
                StartCoroutine(_auditService.WriteAudit(action: "User logged in", oldValue: null, newValue: null));
                ToggleLoginCanvas(false);
                ToggleJoinGameCanvas(true);
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
                GameObject gameEntry = Instantiate(gameEntryPrefab, gameListContainer);
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

        private void ToggleJoinGameCanvas(bool state)
        {
            joinGameCanvas.SetActive(state);

            if (state)
            {
                StartCoroutine(RenderGameList());
            }
        }

        private void ToggleLoginCanvas(bool state)
        {
            loginCanvas.SetActive(state);
        }
    }
}