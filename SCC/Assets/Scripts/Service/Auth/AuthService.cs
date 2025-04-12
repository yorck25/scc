using System.Collections;
using System.Net.WebSockets;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.Networking;
using System;

namespace Service.Auth
{
    public class AuthService : MonoBehaviour
    {
        public static AuthService Instance { get; private set; }

        private AuthToken _authToken;
        private GameToken _gameToken;
        private WebSocketClient _webSocketClient;
        private const string BaseUrl = GameConfig.BaseUrl;

        private void Awake()
        {
            if (Instance == null)
            {
                Instance = this;
                Debug.Log("✅ AuthService initialized successfully");
            }
            else
            {
                Destroy(gameObject);
            }
        }

        private void Start()
        {
            _authToken = AuthToken.Instance;
            _gameToken = GameToken.Instance;
            _webSocketClient = WebSocketClient.Instance;
        }

        public async Task<bool> ValidateAuthToken()
        {
            var request = UnityWebRequest.Get(BaseUrl + "/validate-auth-token").AddAuthHeader();
            request.SendWebRequest();
            
            while (!request.isDone)
            {
                await Task.Yield();
            }
            
            if (request.result == UnityWebRequest.Result.Success)
            {
                return true;
            }
            
            return false;
        }
        
        public async Task<bool> ValidateGameToken()
        {
            var request = UnityWebRequest.Get(BaseUrl + "/validate-game-token").AddAuthHeader();
            request.SendWebRequest();
            
            while (!request.isDone)
            {
                await Task.Yield();
            }
            
            if (request.result == UnityWebRequest.Result.Success)
            {
                return true;
            }
            
            return false;
        }
        
        public async Task<bool> Login(string playerName, string password)
        {
            var request = UnityWebRequest.Get(BaseUrl + "/login");
            request.SetRequestHeader("playerName", playerName);
            request.SetRequestHeader("password", password);

            request.SendWebRequest();
            
            while (!request.isDone)
            {
                await Task.Yield();
            }

            if (request.result != UnityWebRequest.Result.Success)
            {
                Debug.LogError("Login failed: " + request.error);
                return false;
            }

            _authToken = JsonUtility.FromJson<AuthToken>(request.downloadHandler.text);
            Debug.Log("Logged in, token: " + _authToken.token);
            return true;
        }


        public async Task<bool> JoinGame(int gameId, string password)
        {
            var request = UnityWebRequest.Get(BaseUrl + "/join-game").AddAuthHeader();

            request.SetRequestHeader("gameId", gameId.ToString());
            request.SetRequestHeader("password", password);
            request.SendWebRequest();

            while (!request.isDone)
            {
                await Task.Yield();
            }

            if (request.result != UnityWebRequest.Result.Success)
            {
                Debug.LogError("Join game failed: " + request.error);
                return false;
            }

            var tempToken = JsonUtility.FromJson<GameToken>(request.downloadHandler.text);
            GameToken.Instance.token = tempToken.token;

            if (string.IsNullOrEmpty(GameToken.Instance.token))
            {
                Debug.LogError("Game token is null or empty after JoinGame response!");
                return false;
            }

            Debug.Log("Joined game, token: " + GameToken.Instance.token);
            return await ConnectToWebsocket();
        }

        public async Task<bool> LeaveGame()
        {
            var success = await DisconnectFromWebsocket();
            if (success)
            {
                GameToken.Instance.token = null;
            }

            return success;
        }

        private async Task<bool> ConnectToWebsocket()
        {
            Debug.Log("Trying to connect to WebSocket...");
            bool success = await _webSocketClient.Connect();
            return success;
        }

        private async Task<bool> DisconnectFromWebsocket()
        {
            if (_webSocketClient != null)
            {
                var res = await _webSocketClient.CloseConnection();
                Debug.Log("Disconnected from WebSocket");
                return res;
            }

            return false;
        }

        public string GetAuthToken()
        {
            return _authToken.token;
        }

        public string GetGameToken()
        {
            return _gameToken.token;
        }
    }
}