using System.Collections;
using UnityEngine;
using UnityEngine.Networking;

namespace Service
{
    public class AuditService : MonoBehaviour
    {
        private const string BaseUrl = "http://localhost:5555";

        private AuthService _authService;

        private void Awake()
        {
            _authService = AuthService.Instance;
        }

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
}