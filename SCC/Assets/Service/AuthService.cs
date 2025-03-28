using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;

class AuthToken
{
    public string authToken = "";

    public override string ToString()
    {
        return "authToken: " + authToken;
    }
}
public class AuthService
{
    AuthToken authToken = new ();
    private const string BaseUrl = "http://localhost:5555";
    
    public IEnumerator Login(string playerName, string password)
    {
        Debug.Log("handle login request");
        var request = UnityWebRequest.Get(BaseUrl + "/login");
        request.SetRequestHeader("playerName", playerName);
        request.SetRequestHeader("password", password);
        yield return request.SendWebRequest();

        if (request.result != UnityWebRequest.Result.Success)
        {
            Debug.Log(request.error);
        }
        else
        {
            authToken = JsonUtility.FromJson<AuthToken>(request.downloadHandler.text);
        }
    }
}
