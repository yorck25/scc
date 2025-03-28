using System.Collections;
using System.Collections.Generic;
using Service;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Ui
{
    public class MenuManager : MonoBehaviour
    {
        [SerializeField] private TextMeshProUGUI usernameText;

        [SerializeField] private Button loginButton;

        [SerializeField] private TMP_InputField playerNameInputField, passwordInputField;

        private readonly AuthService _authService = AuthService.Instance;
        private string _playerName = "";
        private string _password = "";

        // Start is called before the first frame update
        void Start()
        {
            loginButton.onClick.AddListener(() => Login());
        }

        // Update is called once per frame
        void Update()
        {
            if (playerNameInputField.text != _playerName || passwordInputField.text != _password)
            {
                _playerName = playerNameInputField.text;
                _password = passwordInputField.text;
            }

            var isValid = _password.Length > 0 && _playerName.Length > 0;
            loginButton.enabled = isValid;
        }

        private void Login()
        {
            StartCoroutine(AuthService.Instance?.Login(_playerName, _password));
        }
    }   
}