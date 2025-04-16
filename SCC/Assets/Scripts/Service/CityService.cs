using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.Networking;

namespace Service
{
    [Serializable]
    public class CityListWrapper
    {
        public List<City> cities;
    }

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
        public List<City> CityList = new();

        private const string BaseUrl = GameConfig.BaseUrl;
        private GameService _gameService => GameService.Instance;

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

        public async Task LoadCitiesForGame()
        {
            try
            {
                var request = UnityWebRequest.Get(BaseUrl + "/cities").AddGameAuth();
                request.SendWebRequest();

                while (!request.isDone)
                {
                    await Task.Yield();
                }

                if (request.result != UnityWebRequest.Result.Success)
                {
                    Debug.LogError("Failed to load cities");
                    return;
                }

                DecodeResponseToCityList(request);
            }
            catch (Exception ex)
            {
                Debug.LogError($"Exception in Load Cities: {ex.Message}");
                CityList = new List<City>();
            }
        }

        private void DecodeResponseToCityList(UnityWebRequest request)
        {
            try
            {
                var wrapper = JsonUtility.FromJson<CityListWrapper>(
                    "{\"cities\":" + request.downloadHandler.text + "}");

                CityList = wrapper.cities;
            }
            catch (Exception ex)
            {
                Debug.LogError($"Error parsing search results: {ex.Message}");
            }
        }

        public async Task<bool> CreateCity(string cityName)
        {
            if (_gameService == null)
            {
                Debug.LogError("CityService: _gameService is null!");
            }

            if (_gameService.CurrentGame == null)
            {
                Debug.LogError("CityService: _gameService.CurrentGame is null!");
                return false;
            }

            var ccr = new CreateCityRequest
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