using System;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.Networking;

namespace Service
{
    [Serializable]
    public class City
    {
        public int cityId;
        public string name;
        public int gameId;
        public int ownerId;
    }

    [Serializable]
    public class CreateCityRequest
    {
        public string name;
        public int gameId;
    }

    public class CityService : MonoBehaviour
    {
        public static CityService Instance { get; private set; }
        public City CurrentCity;

        private const string BaseUrl = GameConfig.BaseUrl;
        private GameService _gameService;

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

            _gameService = GameService.Instance;
        }

        public async Task<bool> CreateCity(string cityName)
        {
            CreateCityRequest ccr = new CreateCityRequest
            {
                name = cityName,
                gameId = _gameService.CurrentGame.gameId
            };

            var jsonCityRequest = JsonUtility.ToJson(ccr);

            var request = UnityWebRequest.Post(BaseUrl + "/city", jsonCityRequest, "application/json").AddGameAuth();
            request.SendWebRequest();

            while (!request.isDone)
            {
                await Task.Yield();
            }

            if (request.result != UnityWebRequest.Result.Success)
            {
                Debug.LogError($"Failed to create city: {request.error}");
                return false;
            }

            try
            {
                City createdCity = JsonUtility.FromJson<City>(request.downloadHandler.text);
                Debug.Log(createdCity);
                CurrentCity = createdCity;
                return true;
            }
            catch (Exception ex)
            {
                Debug.LogError($"Error parsing city create result: {ex.Message}");
                return false;
            }
        }
    }
}