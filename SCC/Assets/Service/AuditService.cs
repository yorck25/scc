using System;
using System.Collections;
using JetBrains.Annotations;
using Service.Auth;
using UnityEngine;
using UnityEngine.Networking;

namespace Service
{
    [Serializable]
    public class CreateAuditRequest
    {
        public string action;
        public string oldValue;
        public string newValue;
    }

    public class AuditService : MonoBehaviour
    {
        public static AuditService Instance { get; private set; }

        private const string BaseUrl = "http://localhost:5555";
        private AuthService _authService;

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

        private void Start()
        {
            _authService = AuthService.Instance;
        }

        public IEnumerator WriteAudit(string action, [CanBeNull] string oldValue, [CanBeNull] string newValue)
        {
            CreateAuditRequest auditRequest = new CreateAuditRequest
            {
                action = action,
                oldValue = string.IsNullOrEmpty(oldValue) ? null : oldValue,
                newValue = string.IsNullOrEmpty(newValue) ? null : newValue
            };

            var jsonAuditRequest = JsonUtility.ToJson(auditRequest);

            var request = UnityWebRequest.Post(BaseUrl + "/audit", jsonAuditRequest, "application/json").AddAuthHeader();
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