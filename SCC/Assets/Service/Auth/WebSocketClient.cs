using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.WebSockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using UnityEngine;

namespace Service.Auth
{
    public class WebSocketClient : MonoBehaviour
    {
        private GameToken _gameToken;
        private ClientWebSocket _webSocket;
        private readonly string _webSocketUrl = "ws://localhost:5555/ws";
        private CancellationTokenSource _cancellationTokenSource;
        public static WebSocketClient Instance { get; private set; }
        public bool IsConnected => _webSocket?.State == WebSocketState.Open;

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
            _gameToken = GameToken.Instance;
        }

        public async Task<bool> Connect()
        {
            if (string.IsNullOrEmpty(GameToken.Instance.token))
            {
                Debug.LogError("Cannot connect to WebSocket: game token is missing!");
                return false;
            }

            _cancellationTokenSource = new CancellationTokenSource();
            _webSocket = new ClientWebSocket();

            Debug.Log("Using Game Token: " + GameToken.Instance.token);
            _webSocket.Options.SetRequestHeader("X-Game-Token", GameToken.Instance.token);
    
            try
            {
                await _webSocket.ConnectAsync(new Uri(_webSocketUrl), _cancellationTokenSource.Token);
                Debug.Log("WebSocket connected to " + _webSocketUrl);
                StartReceiving();
                return true;
            }
            catch (Exception e)
            {
                Debug.LogError("WebSocket connection error: " + e.Message);
                return false;
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

        public async void SendWsMessage(string message)
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
}