using System;
using System.Collections;
using System.Collections.Generic;
using Service;
using Service.Auth;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.Networking;

namespace Service
{
    public static class UnityWebRequestExtensions
    {
        public static UnityWebRequest AddAuthHeader(this UnityWebRequest request)
        {
            string authToken = AuthService.Instance?.GetAuthToken();
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
            AddAuthHeader(request);

            string gameToken = AuthService.Instance?.GetGameToken();
            if (!string.IsNullOrEmpty(gameToken))
            {
                request.SetRequestHeader("gameToken", gameToken);
            }

            return request;
        }
    }
}