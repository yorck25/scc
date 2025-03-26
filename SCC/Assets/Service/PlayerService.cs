using System;
using System.Collections;
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
    
    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.I))
        {
            StartCoroutine(GetPlayerFromToken("/player"));
        }
    }

    IEnumerator GetPlayerFromToken(string uri)
    {
        var request = UnityWebRequest.Get(BaseUrl + uri).AddAuthHeader();
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
