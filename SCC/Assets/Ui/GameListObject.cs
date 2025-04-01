using System.Collections;
using System.Linq.Expressions;
using Service;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Ui
{
    public class GameListObject : MonoBehaviour
    {
        [SerializeField] private TMP_Text gameNameText;
        [SerializeField] private Button joinButton;
        [SerializeField] private TMP_InputField passwordInput;

        private Game _gameData;
        private GameService _gameService;

        public void Setup(Game gameData)
        {
            _gameData = gameData;
            gameNameText.text = gameData.name;
            joinButton.onClick.AddListener(() => OnJoinButtonClicked());
        }

        private void Start()
        {
            _gameService = GameService.Instance;
        }

        private void OnJoinButtonClicked()
        {
            string enteredPassword = passwordInput.text;
            Debug.Log(enteredPassword);
            _gameService.JoinGame(_gameData.gameId, enteredPassword);
        }
    }
}