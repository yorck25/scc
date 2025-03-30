using System.Collections;
using System.Collections.Generic;
using Service;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

namespace Ui
{
    public class MenuManager : MonoBehaviour
    {
        public static MenuManager Instance { get; private set; }

        [Header("UI Canvases")] [SerializeField]
        private GameObject loginCanvas;

        [SerializeField] public GameObject joinGameCanvas;

        [Header("Login Canvas UI-Elements")] [SerializeField]
        private Button loginButton;

        [SerializeField] private TMP_InputField playerNameInput;

        [SerializeField] private TMP_InputField passwordInput;

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
        }

        private void Start()
        {
            loginButton.onClick.AddListener(() => StartCoroutine(Login()));
            _authService = AuthService.Instance;
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
                Debug.Log("Login successful! Switching UI...");
                loginCanvas.SetActive(false);
                joinGameCanvas.SetActive(true);
            }
            else
            {
                Debug.LogError("Login failed: No token received.");
            }
        }
    }
}