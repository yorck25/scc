using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using Service.Auth;
using Ui;
using UnityEngine;
using UnityEngine.Networking;

namespace Service
{
    [Serializable]
    public class Game
    {
        public int gameId;
        public string name;
        public string password;
        public int ownerId;

        public override string ToString()
        {
            return $"ID: {gameId}, Name: {name}, Password: {password}, Owner ID: {ownerId}";
        }
    }

    [Serializable]
    public class GameListWrapper
    {
        public List<Game> games;
    }

    public class GameService : MonoBehaviour
    {
        public static GameService Instance { get; private set; }
        public List<Game> GameList = new();
        public Game CurrentGame;
        private const string BaseUrl = "http://localhost:5555";
        private AuthService _authService;

        private void Awake()
        {
            if (Instance == null)
            {
                Instance = this;
                DontDestroyOnLoad(gameObject);
            }
            else
            {
                Destroy(gameObject);
            }
        }

        private void Start()
        {
            _authService = AuthService.Instance;
        }

        public IEnumerator GetGameList()
        {
            var request = UnityWebRequest.Get(BaseUrl + "/game").AddAuthHeader();
            yield return request.SendWebRequest();

            if (request.result != UnityWebRequest.Result.Success)
            {
                Debug.LogError(request.result + " : Failed to load games");
            }
            else
            {
                try
                {
                    GameListWrapper wrapper =
                        JsonUtility.FromJson<GameListWrapper>("{\"games\":" + request.downloadHandler.text + "}");

                    GameList = wrapper.games;
                }
                catch (Exception ex)
                {
                    Debug.LogError("Error parsing the game list: " + ex.Message);
                }
            }
        }

        public async Task JoinGame(int gameId, string password)
        {
            Debug.Log("try to login to gane");
            var res = await _authService.JoinGame(gameId, password);
            Debug.Log(res);

            if (res)
            {
                var game = GameList.Find(item => item.gameId == gameId);
                
                if(game == null)
                {
                    Debug.LogError("Game not found");
                    return;
                }
                
                CurrentGame = game;
                
                MenuManager.Instance.ToggleMenu(false);
            }
        }
    }
}