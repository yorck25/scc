using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.Networking;

namespace Service
{
    [Serializable]
    public class Cell
    {
        public int cellId;
        public int x;
        public int y;
        public int buildingId;
        public int cityId;
    }

    [Serializable]
    public class Grid : Cell
    {
        public int cityId;
        public int height;
        public int width;
        public string updatedAt;
        public List<Cell> cells;
    }

    public class GridService : MonoBehaviour
    {
        public static GridService Instance { get; private set; }
        public Grid CurrentGrid;
        private const string BaseUrl = GameConfig.BaseUrl;

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

        public async void LoadGrid(int cityId)
        {
            var request = UnityWebRequest.Get(BaseUrl + "/grid").AddGameAuth();
            request.SetRequestHeader("cityId", cityId.ToString());
            request.SendWebRequest();

            while (!request.isDone)
            {
                await Task.Yield();
            }

            if (request.result != UnityWebRequest.Result.Success)
            {
                Debug.Log("Fail to load grid");
                return;
            }

            try
            {
                CurrentGrid = JsonUtility.FromJson<Grid>(request.downloadHandler.text);
                Debug.Log("Successfully loaded grid");
            }
            catch (Exception ex)
            {
                Debug.LogError($"Failed to parse grid data: {ex.Message}");
            }
        }

        public async void CreateGrid()
        {
            
        }
    }
}