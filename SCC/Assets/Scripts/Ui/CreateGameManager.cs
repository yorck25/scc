using System.Collections;
using System.Collections.Generic;
using Service;
using TMPro;
using Ui;
using UnityEngine;
using UnityEngine.UI;

public class CreateGameManager : MonoBehaviour
{
    public static CreateGameManager Instance { get; private set; }

    [Header("UI Elements")] 
    [SerializeField] private GameObject createGameCanvas;
    [SerializeField] private Button closeCreateCanvasButton;
    [SerializeField] private Button createGameButton;
    [SerializeField] private TMP_InputField createGameNameInput;
    [SerializeField] private TMP_InputField createGamePasswordInput;

    private GameService _gameService;

    void Start()
    {
        closeCreateCanvasButton.onClick.AddListener(CloseCreateGameCanvas);
        createGameButton.onClick.AddListener(CreateGame);
        
        _gameService = GameService.Instance;
    }

    private void CloseCreateGameCanvas()
    {
        createGameCanvas.SetActive(false);
    }

    private async void CreateGame()
    {
        var name = createGameNameInput.text;
        var password = createGamePasswordInput.text;

        if (name == "" || password == "")
        {
            Debug.LogError("missing name or password to create a game");
            return;
        }

        if (_gameService == null)
        {
            Debug.LogError("no game service provided");
            return;
        }
        
        var res = await _gameService.CreateGame(name, password);
        if (res)
        {
            createGameNameInput.text = "";
            createGamePasswordInput.text = "";
            CloseCreateGameCanvas();
            MenuManager.Instance.RerenderGameList();
        }
    }
}
