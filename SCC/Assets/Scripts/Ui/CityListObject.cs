using Service;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Ui
{
    public class CityListObject : MonoBehaviour
    {
        [SerializeField] private TMP_Text cityNameText;
        [SerializeField] private Button useCityButton;

        private City _cityData;
        private CityService _cityService;

        public void Setup(City cityData)
        {
            _cityData = cityData;
            cityNameText.text = cityData.name;
            useCityButton.onClick.AddListener(() => OnUseCityButtonClicked());
        }

        void Start()
        {
            _cityService = CityService.Instance;
        }

        private void OnUseCityButtonClicked()
        {
            _cityService.CurrentCity = _cityData;
            if(_cityService.CurrentCity == null)
            {
                Debug.LogError("City is null");
                return;
            }
            
            GameCanvasManager.Instance.ChangeDisplayedCanvas(InGameUiElement.GamePlay);
        }
    }
}