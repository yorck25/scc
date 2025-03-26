using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;

public class AuditService : MonoBehaviour
{
    private const string BaseUrl = "http://localhost:5555";

    public IEnumerator WriteAudit(string uri)
    {
        var request = UnityWebRequest.Get(BaseUrl + uri).AddAuthHeader();
        yield return request.SendWebRequest();
        
        if (request.result != UnityWebRequest.Result.Success)
        {
            Debug.Log(request.error);
        }
        else
        {
            Debug.Log("Audit written successfully");
        }
    }
}
