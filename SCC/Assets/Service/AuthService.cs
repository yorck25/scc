using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.Networking;

namespace Service {
 public class AuthToken
 {
     public static AuthToken Instance { get; private set; }
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
 
     public IEnumerator Login(string playerName, string password)
     {
         var request = UnityWebRequest.Get(BaseUrl + "/login");
         request.SetRequestHeader("playerName", playerName);
         request.SetRequestHeader("password", password);
         yield return request.SendWebRequest();
 
         if (request.result != UnityWebRequest.Result.Success)
         {
             Debug.LogError("Login failed: " + request.error);
         }
         else
         {
             AuthToken = JsonUtility.FromJson<AuthToken>(request.downloadHandler.text);
             Debug.Log("Logged in, token: " + AuthToken.authToken);
         }
     }
 
     public string GetToken()
     {
         return AuthToken.authToken;
     }
 }
}
