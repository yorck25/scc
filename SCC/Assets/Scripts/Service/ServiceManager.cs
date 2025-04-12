using System.Collections;
using Service;
using Service.Auth;
using UnityEngine;

public class ServiceManager : MonoBehaviour
{
    public static ServiceManager Instance { get; private set; }

    public AuthService AuthService { get; private set; }
    public GameService GameService { get; private set; }
    public AuditService AuditService { get; private set; }
    public PlayerService PlayerService { get; private set; }
    
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
        AuthService = FindObjectOfType<AuthService>();
        GameService = FindObjectOfType<GameService>();
        AuditService = FindObjectOfType<AuditService>();
        PlayerService = FindObjectOfType<PlayerService>();
    }
}