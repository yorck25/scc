using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;

namespace Service
{
    [System.Serializable]
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

    [System.Serializable]
    public class GameListWrapper
    {
        public List<Game> games;
    }

    public class GameService : MonoBehaviour
    {
        public static GameService Instance { get; private set; }
        public List<Game> GameList = new();
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

        public IEnumerator JoinGame(int gameId, string password, System.Action<bool> callback)
        {
            // Simulate joining a game
            Debug.Log("try to login to gane");
            // callback(true);
            yield return new WaitForSeconds(1f);
        }
    }
}