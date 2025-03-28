using System.Collections;
using System.Collections.Generic;
using Service;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.Networking;

public class NetworkAdapter : MonoBehaviour
{
}

public static class UnityWebRequestExtensions
{
    public static UnityWebRequest AddAuthHeader(this UnityWebRequest request)
    {
        string authToken = AuthService.Instance?.GetToken();
        if (!string.IsNullOrEmpty(authToken))
        {
            request.SetRequestHeader("authToken", authToken);
        }
        else
        {
            Debug.LogError("Auth token is missing!");
        }
        return request;
    }
    
    public static UnityWebRequest AddGameAuth(this UnityWebRequest request)
    {
        string gameToken = AuthService.Instance?.GetToken();
        if (!string.IsNullOrEmpty(gameToken))
        {
            request.SetRequestHeader("gameToken", gameToken);
        }
        return request;
    }
}