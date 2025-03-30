using System.Collections;
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
            _gameData = _gameData;
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
            StartCoroutine(JoinGame(_gameData.gameId, enteredPassword));
        }

        private IEnumerator JoinGame(int gameId, string password)
        {
            bool isJoined = false;
            yield return StartCoroutine(_gameService.JoinGame(gameId, password, (success) => { isJoined = success; }));

            if (isJoined)
            {
                Debug.Log("Joined game successfully!");
            }
            else
            {
                Debug.LogError("Failed to join the game.");
            }
        }
    }
}