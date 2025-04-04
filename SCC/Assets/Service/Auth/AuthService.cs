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
        private const string BaseUrl = "http://localhost:5555";

        private void Awake()
        {
            if (Instance == null)
            {
                Instance = this;
                Debug.Log("✅ AuthService initialized successfully");
            }
            else
            {
                Debug.LogWarning("⚠️ Duplicate AuthService detected! Destroying...");
                Destroy(gameObject);
            }
        }

        private void Start()
        {
            _authToken = AuthToken.Instance;
            _gameToken  = GameToken.Instance;
            _webSocketClient = WebSocketClient.Instance;
        }

        public IEnumerator Login(string playerName, string password, Action<bool> callback)
        {
            var request = UnityWebRequest.Get(BaseUrl + "/login");
            request.SetRequestHeader("playerName", playerName);
            request.SetRequestHeader("password", password);

            yield return request.SendWebRequest();

            if (request.result != UnityWebRequest.Result.Success)
            {
                Debug.LogError("Login failed: " + request.error);
                callback(false);
            }
            else
            {
                _authToken = JsonUtility.FromJson<AuthToken>(request.downloadHandler.text);
                Debug.Log("Logged in, token: " + _authToken.token);
                callback(true);
            }
        }

        public async Task<bool> JoinGame(int gameId, string password)
        {
            using (var request = UnityWebRequest.Get(BaseUrl + "/join-game").AddAuthHeader())
            {
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

        public bool IsUserLoggedIn()
        {
            return GetAuthToken() != null;
        }
    }
}