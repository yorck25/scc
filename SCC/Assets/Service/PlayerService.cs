using System;
using System.Collections;
using Service;
using Service.Auth;
using UnityEngine;
using UnityEngine.Networking;


[Serializable]
public class Player
{
    public int id;
    public string username;
    public string email;
    public string password;

    public override string ToString()
    {
        return $"ID: {id}, Name: {username}, Email: {email}";
    }
}

public class PlayerService : MonoBehaviour
{
    private const string BaseUrl = "http://localhost:5555";

    private Player _player = new Player();
    
    private AuthService _authService;

    private void Awake()
    {
        _authService = AuthService.Instance;
    }
    
    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.I))
        {
            StartCoroutine(GetPlayerFromToken());
        }
    }

    IEnumerator GetPlayerFromToken()
    {
        var request = UnityWebRequest.Get(BaseUrl + "/player").AddAuthHeader();
        yield return request.SendWebRequest();

        if (request.result != UnityWebRequest.Result.Success)
        {
            Debug.Log(request.error);
        }
        else
        {
            _player = JsonUtility.FromJson<Player>(request.downloadHandler.text);
        }
    }
}
