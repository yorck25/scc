using System;
using System.Collections;
using System.Collections.Generic;
using Service;
using Ui;
using UnityEngine;
using UnityEngine.UI;

public class GameCanvas : MonoBehaviour
{
    [SerializeField] private Button leaveButton;
    
    private GameService _gameService;
    
    private void Start()
    {
        _gameService = GameService.Instance;
        leaveButton.onClick.AddListener(() => OnLeaveButtonClick());
    }

    private async void OnLeaveButtonClick()
    {
        Debug.Log("start leave process");
        // await _gameService.LeaveGame();
        // MenuManager.Instance.LeaveGame(false);
    }
}
