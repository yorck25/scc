using System.Collections;
using System.Net.WebSockets;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.Networking;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;

namespace Service
{
    public class AuthToken
    {
        private static AuthToken _instance;
        public static AuthToken Instance => _instance ??= new AuthToken();
        public string token = "";

        public override string ToString()
        {
            return "authToken: " + token;
        }
    }

    public class GameToken
    {
        private static GameToken _instance;
        public static GameToken Instance => _instance ??= new GameToken();
        public string token = "";

        public override string ToString()
        {
            return "gameToken: " + token;
        }
    }

    public class WebSocketClient : MonoBehaviour
    {
        private ClientWebSocket _webSocket;
        private readonly string _webSocketUrl = "ws://localhost:5555/ws";
        private CancellationTokenSource _cancellationTokenSource;
        public static WebSocketClient Instance { get; private set; }

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

        public async void Connect()
        {
            _cancellationTokenSource = new CancellationTokenSource();
            _webSocket = new ClientWebSocket();

            try
            {
                await _webSocket.ConnectAsync(new Uri(_webSocketUrl), _cancellationTokenSource.Token);
                Debug.Log("WebSocket connected to " + _webSocketUrl);
                StartReceiving();
            }
            catch (Exception e)
            {
                Debug.LogError("WebSocket connection error: " + e.Message);
            }
        }

        private async void StartReceiving()
        {
            var buffer = new byte[1024];
            while (_webSocket.State == WebSocketState.Open)
            {
                var result =
                    await _webSocket.ReceiveAsync(new ArraySegment<byte>(buffer), _cancellationTokenSource.Token);
                var message = Encoding.UTF8.GetString(buffer, 0, result.Count);
                Debug.Log("Received: " + message);
            }
        }

        public async void SendMessage(string message)
        {
            if (_webSocket.State == WebSocketState.Open)
            {
                var bytes = Encoding.UTF8.GetBytes(message);
                await _webSocket.SendAsync(new ArraySegment<byte>(bytes), WebSocketMessageType.Text, true,
                    _cancellationTokenSource.Token);
            }
        }

        private async void OnApplicationQuit()
        {
            await CloseConnection();
        }

        public async Task CloseConnection()
        {
            if (_webSocket != null)
            {
                await _webSocket.CloseAsync(WebSocketCloseStatus.NormalClosure, "Closing",
                    _cancellationTokenSource.Token);
                _webSocket.Dispose();
                _webSocket = null;
            }
        }
    }

    public class AuthService : MonoBehaviour
    {
        public static AuthService Instance { get; private set; }
        public AuthToken AuthToken = AuthToken.Instance;
        public GameToken GameToken = GameToken.Instance;
        private const string BaseUrl = "http://localhost:5555";

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
                AuthToken = JsonUtility.FromJson<AuthToken>(request.downloadHandler.text);
                Debug.Log("Logged in, token: " + AuthToken.token);
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
                    Debug.LogError("Login failed: " + request.error);
                    return false;
                }
                
                GameToken = JsonUtility.FromJson<GameToken>(request.downloadHandler.text);
                Debug.Log("Logged in, token: " + GameToken.token);
                return true;
            }
        }

        public bool HasAuthToken()
        {
            return !string.IsNullOrEmpty(AuthToken.token);
        }


        public string GetToken()
        {
            return AuthToken.token;
        }
    }
}