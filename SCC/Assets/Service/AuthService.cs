using System.Collections;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.Networking;

namespace Service
{
    public class AuthToken
    {
        private static AuthToken _instance;
        public static AuthToken Instance => _instance ??= new AuthToken(); // Lazy initialization
        public string authToken = "";

        public override string ToString()
        {
            return "authToken: " + authToken;
        }
    }

    public class AuthService : MonoBehaviour
    {
        public static AuthService Instance { get; private set; }
        public AuthToken AuthToken = AuthToken.Instance;
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

        public IEnumerator Login(string playerName, string password, System.Action<bool> callback)
        {
            var request = UnityWebRequest.Get(BaseUrl + "/login");
            request.SetRequestHeader("playerName", playerName);
            request.SetRequestHeader("password", password);

            yield return request.SendWebRequest(); // Wait for response

            if (request.result != UnityWebRequest.Result.Success)
            {
                Debug.LogError("Login failed: " + request.error);
                callback(false);
            }
            else
            {
                AuthToken = JsonUtility.FromJson<AuthToken>(request.downloadHandler.text);
                Debug.Log("Logged in, token: " + AuthToken.authToken);
                callback(true);
            }
        }

        public bool HasAuthToken()
        {
            return !string.IsNullOrEmpty(AuthToken.authToken);
        }


        public string GetToken()
        {
            return AuthToken.authToken;
        }
    }
}