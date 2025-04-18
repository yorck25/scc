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
        public static WebSocketClient Instance { get; private set; }

        private GameToken _gameToken;
        private ClientWebSocket _webSocket;
        private readonly string _webSocketUrl = "ws://localhost:5555/ws";
        private CancellationTokenSource _cancellationTokenSource;

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
            _cancellationTokenSource = new CancellationTokenSource();
            _webSocket = new ClientWebSocket();
            _webSocket.Options.SetRequestHeader("X-Game-Token", GameToken.Instance.token);

            try
            {
                await _webSocket.ConnectAsync(new Uri(_webSocketUrl), _cancellationTokenSource.Token);
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
                try
                {
                    WebSocketReceiveResult result = await _webSocket.ReceiveAsync(new ArraySegment<byte>(buffer),
                        _cancellationTokenSource.Token);
                    if (result.MessageType == WebSocketMessageType.Close)
                    {
                        await CloseConnection();
                        return;
                    }

                    string message = Encoding.UTF8.GetString(buffer, 0, result.Count);
                    Debug.Log("Received: " + message);
                }
                catch (Exception e)
                {
                    Debug.LogError("WebSocket receive error: " + e.Message);
                    await Task.Delay(1000);
                }
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

        public async Task<bool> CloseConnection()
        {
            try
            {
                if (_webSocket == null)
                {
                    return false;
                }
                
                if (_webSocket.State == WebSocketState.Open)
                {
                    await _webSocket.CloseAsync(WebSocketCloseStatus.NormalClosure, string.Empty, CancellationToken.None);
                    _webSocket.Dispose();
                    _webSocket = null;
                }
                
                return true;
            }
            catch (Exception ex)
            {
                Debug.LogError("Error closing WebSocket connection: " + ex.Message);
                return false;
            }
        }
    }
}