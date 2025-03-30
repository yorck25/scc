using System.Collections;
using UnityEngine;
using UnityEngine.Networking;

namespace Service
{
    public class AuditService : MonoBehaviour
    {
        public static AuditService Instance { get; private set; }
        
        private const string BaseUrl = "http://localhost:5555";
        private AuthService _authService;


        private void Awake()
        {
            _authService = AuthService.Instance;
        }

        public IEnumerator WriteAudit()
        {
            var auditRequest = new
            {
                action = "action",
                oldValue = "oldValue",
                newValue = "newValue"
            };

            var jsonAuditRequest = JsonUtility.ToJson(auditRequest);
            
            var request = UnityWebRequest.PostWwwForm(BaseUrl + "/audit", jsonAuditRequest).AddAuthHeader();
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