using System.Collections;
using System.Collections.Generic;
using Service;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.Networking;

namespace Service
{
    public class Game
    {
        public static Game Instance { get; private set; }

        public int gameId;
        public string name;
        public string password;
        public int ownerId;
    }

    public class GameService : MonoBehaviour
    {
        public static GameService Instance { get; private set; }
        private const string BaseUrl = "http://localhost:5555";
        private AuthService _authService;
        public List<Game> GameList = new(); 
        private Game _game = Game.Instance;

        private void Awake()
        {
            _authService = AuthService.Instance;
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

        public IEnumerable SearchGame(string searchValue)
        {
            var request = UnityWebRequest.Get(BaseUrl + "/game/" + searchValue).AddAuthHeader();
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

        public IEnumerator CreateGame()
        {
            var postData = "{ \"name\": test, \"password\": 2 }";
            
            var request = UnityWebRequest.PostWwwForm(uri: BaseUrl + "/game", postData: postData).AddAuthHeader();
            yield return null;
        }
        
        public IEnumerator UpdateGame()
        {
            yield return null;
        }
        
        public IEnumerator DeleteGame()
        {
            yield return null;
        }
    }
}