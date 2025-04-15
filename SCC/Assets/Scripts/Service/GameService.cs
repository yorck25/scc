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
            return $"ID: {gameId}, Name: {name}, Owner ID: {ownerId}";
        }
    }

    [Serializable]
    public class CreateGameRequest
    {
        public string name;
        public string password;
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
        public bool IsInGame;
        public bool IsBuildModeActive;
        private const string BaseUrl = GameConfig.BaseUrl;
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
            
            _authService = AuthService.Instance;
        }
        private void Start()
        {
            StartCoroutine(InitializeAfterAuthService());
        }

        private IEnumerator InitializeAfterAuthService()
        {
            while (_authService == null)
            {
                _authService = AuthService.Instance;
                yield return null;
            }

            yield return StartCoroutine(ValidateGameTokenRoutine());
        }

        private IEnumerator ValidateGameTokenRoutine()
        {
            var validateTask = _authService.ValidateGameToken();
            yield return new WaitUntil(() => validateTask.IsCompleted);
    
            if (_authService.GetGameToken() != "" && validateTask.Result)
            {
                IsInGame = true;
            }
            else
            {
                Debug.LogError("Game token is invalid or not set");
            }
        }

        public void ToggleBuildMode()
        {
            IsBuildModeActive = !IsBuildModeActive;
        }

        public async Task GetGameList()
        {
            try
            {
                var request = UnityWebRequest.Get(BaseUrl + "/game").AddAuthHeader();
                request.SendWebRequest();

                while (!request.isDone)
                {
                    await Task.Yield();
                }

                if (request.result != UnityWebRequest.Result.Success)
                {
                    Debug.LogError($"Failed to load games: {request.error} (HTTP {request.responseCode})");
                    return;
                }

                if (string.IsNullOrEmpty(request.downloadHandler.text))
                {
                    Debug.LogWarning("Received empty game list");
                    GameList = new List<Game>();
                    return;
                }

                try
                {
                    DecodeResponseToGameList(request);
                }
                catch (Exception ex)
                {
                    Debug.LogError($"Error parsing games: {ex.Message}\nResponse: {request.downloadHandler.text}");
                    GameList = new List<Game>();
                }
            }
            catch (Exception ex)
            {
                Debug.LogError($"Exception in GetGameList: {ex.Message}");
                GameList = new List<Game>();
            }
        }

        public async Task SearchGame(string value)
        {
            try
            {
                if (string.IsNullOrEmpty(value))
                {
                    await GetGameList();
                    return;
                }

                var request = UnityWebRequest.Get(BaseUrl + "/game/" + value).AddAuthHeader();
                request.SendWebRequest();

                while (!request.isDone)
                {
                    await Task.Yield();
                }

                if (request.result != UnityWebRequest.Result.Success)
                {
                    Debug.LogError($"Failed to search games: {request.error}");
                    return;
                }
                
                DecodeResponseToGameList(request);
            }
            catch (Exception ex)
            {
                Debug.LogError($"Exception in SearchGame: {ex.Message}");
                GameList = new List<Game>();
            }
        }

        private void DecodeResponseToGameList(UnityWebRequest request)
        {
            try
            {
                var wrapper = JsonUtility.FromJson<GameListWrapper>(
                    "{\"games\":" + request.downloadHandler.text + "}");

                GameList = wrapper.games;
            }
            catch (Exception ex)
            {
                Debug.LogError($"Error parsing search results: {ex.Message}");
            }
        }

        public async Task<bool> CreateGame(string name, string password)
        {
            CreateGameRequest gameRequest = new CreateGameRequest
            {
                name = name,
                password = password
            };

            var jsonGameRequest = JsonUtility.ToJson(gameRequest);

            var request = UnityWebRequest.Post(BaseUrl + "/game", jsonGameRequest, "application/json").AddAuthHeader();
            request.SendWebRequest();

            while (!request.isDone)
            {
                await Task.Yield();
            }

            if (request.result != UnityWebRequest.Result.Success)
            {
                Debug.LogError($"Failed to create game: {request.error}");
                return false;
            }

            Debug.Log("Game was successfully created");

            try
            {
                Game createdGamesRes = JsonUtility.FromJson<Game>(request.downloadHandler.text);

                Debug.Log(createdGamesRes);
                GameList.Add(createdGamesRes);
            }
            catch (Exception ex)
            {
                Debug.LogError($"Error parsing search results: {ex.Message}");
            }

            return true;
        }

        public async Task<bool> JoinGame(int gameId, string password)
        {
            try
            {
                Debug.Log($"Attempting to join game {gameId}");
                var res = await _authService.JoinGame(gameId, password);

                if (res)
                {
                    CurrentGame = GameList.Find(item => item.gameId == gameId);
                    if (CurrentGame == null)
                    {
                        Debug.LogError("Game not found in local list");
                        return false;
                    }

                    MenuManager.Instance.ChangeDisplayMenu(MenuManager.UiElement.InGame);
                    IsInGame = true;
                    return true;
                }

                IsInGame = false;
                return false;
            }
            catch (Exception ex)
            {
                Debug.LogError($"Exception in JoinGame: {ex.Message}");
                return false;
            }
        }

        public async Task<bool> LeaveGame()
        {
            try
            {
                Debug.Log("Attempting to leave current game");
                var res = await _authService.LeaveGame();
                if (res)
                {
                    CurrentGame = null;
                    IsInGame = false;
                }

                return res;
            }
            catch (Exception ex)
            {
                Debug.LogError($"Exception in LeaveGame: {ex.Message}");
                return false;
            }
        }
    }
}