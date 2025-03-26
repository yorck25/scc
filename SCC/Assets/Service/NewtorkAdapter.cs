using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;

public class NetworkAdapter : MonoBehaviour
{
}

public static class UnityWebRequestExtensions
{
    private static string jwtToken = "your-default-token";

    public static void SetAuthToken(string token)
    {
        jwtToken = token;
    }

    public static UnityWebRequest AddAuthHeader(this UnityWebRequest request)
    {
        if (!string.IsNullOrEmpty(jwtToken))
        {
            request.SetRequestHeader("Authorization", "Bearer " + jwtToken);
        }
        return request;
    }
}