using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;

namespace Service
{
    [System.Serializable]
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

        // public IEnumerator GetGameList()
        // {
        //     var request = UnityWebRequest.Get(BaseUrl + "/game").AddAuthHeader();
        //     yield return null;
        //
        //     if (request.result != UnityWebRequest.Result.Success)
        //     {
        //         Debug.Log("Fail to lod games");
        //     }
        //     else
        //     {
        //         GameList = JsonUtility.FromJson<List<Game>>(request.downloadHandler.text);
        //         Debug.Log(GameList);
        //
        //         foreach (var item in GameList)
        //         {
        //             Debug.Log(item.name);
        //         }
        //     }
        // }

        public IEnumerator GetGameList()
        {
            // Simulate fetching game list
            yield return new WaitForSeconds(1f);
            GameList = new List<Game>
            {
                new Game { gameId = 1, name = "Game 1" },
                new Game { gameId = 2, name = "Game 2" },
                new Game { gameId = 3, name = "Game 3" }
            };
            Debug.Log("Game list populated.");
        }

        public IEnumerator JoinGame(int gameId, string password, System.Action<bool> callback)
        {
            // Simulate joining a game
            Debug.Log("try to login to gane");
            // callback(true);
            yield return new WaitForSeconds(1f);
            ;
        }
    }
}