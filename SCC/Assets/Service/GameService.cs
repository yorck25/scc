using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;

namespace Service
{
    public class Game
    {
        public int gameId { get; set; }
        public string name { get; set; }
        public string password { get; set; }
        public int ownerId { get; set; }

        public override string ToString()
        {
            return $"ID: {gameId}, Name: {name}, Password: {password}, Owner ID: {ownerId}";
        }
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
            yield return null;

            if (request.result != UnityWebRequest.Result.Success)
            {
                Debug.Log("Fail to lod games");
            }
            else
            {
                GameList = JsonUtility.FromJson<List<Game>>(request.downloadHandler.text);
                Debug.Log(GameList);
            }
        }
    }
}