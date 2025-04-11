using Service;
using Ui;
using UnityEngine;
using UnityEngine.UI;

public class GameCanvas : MonoBehaviour
{
    [SerializeField] private Button leaveButton;
    [SerializeField] private Button toggleBuildModeButton;

    private GameService _gameService;

    private void Start()
    {
        _gameService = GameService.Instance;
        leaveButton.onClick.AddListener(() => OnLeaveButtonClick());
        toggleBuildModeButton.onClick.AddListener(() => OnToggleBuildButtonClick());
    }

    private void OnToggleBuildButtonClick()
    {
        _gameService.ToggleBuildMode();
    }

    private async void OnLeaveButtonClick()
    {
        Debug.Log("start leave process");

        if (await _gameService.LeaveGame())
        {
            MenuManager.Instance.ChangeDisplayMenu(MenuManager.UiElement.GameList);
        }
    }
}