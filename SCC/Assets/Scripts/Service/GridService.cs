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
        public int gridCityId;
        public int height;
        public int width;
        public string updatedAt;
        public List<Cell> cells;
    }

    [Serializable]
    public class CreateGridRequest
    {
        public int cityId;
        public int height;
        public int width;
    }

    [Serializable]
    public class CellListWrapper
    {
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
            }
            catch (Exception ex)
            {
                Debug.LogError($"Failed to parse grid data: {ex.Message}");
            }
        }

        public async void CreateGrid(int cityId)
        {
            var cgr = new CreateGridRequest
            {
                cityId = cityId,
                height = 10,
                width = 10,
            };

            var jsonGridRequest = JsonUtility.ToJson(cgr);

            var request = UnityWebRequest.Post(BaseUrl + "/grid", jsonGridRequest, "application/json").AddGameAuth();
            request.SendWebRequest();

            while (!request.isDone)
            {
                await Task.Yield();
            }

            if (request.result != UnityWebRequest.Result.Success)
            {
                Debug.Log("Fail to create new grid");
                return;
            }

            try
            {
                CurrentGrid = JsonUtility.FromJson<Grid>(request.downloadHandler.text);
                Debug.Log(CurrentGrid);
                LoadCells(cityId);
            }
            catch (Exception ex)
            {
                Debug.LogError($"Failed to parse grid data: {ex.Message}");
            }
        }

        public async void LoadCells(int cityId)
        {
            var request = UnityWebRequest.Get(BaseUrl + "/grid/cells").AddGameAuth();
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
                var cellWrapper = JsonUtility.FromJson<CellListWrapper>(request.downloadHandler.text);
                Debug.Log(cellWrapper);
                CurrentGrid.cells = cellWrapper.cells;
                Debug.Log(CurrentGrid);
            }
            catch (Exception ex)
            {
                Debug.LogError($"Failed to parse grid data: {ex.Message}");
            }
        }
        
        public async void UpdateCell(Cell oldCell, int buildingId)
        {
            oldCell.buildingId = buildingId;
            
            var jsonCell = JsonUtility.ToJson(oldCell);
            
            var request = UnityWebRequest.Put(BaseUrl + "/grid/cell", jsonCell, "application/json").AddGameAuth();
            request.SendWebRequest();

            while (!request.isDone)
            {
                await Task.Yield();
            }

            if (request.result != UnityWebRequest.Result.Success)
            {
                Debug.Log("Fail to update cell");
                return;
            }

            try
            {
                var cell = JsonUtility.FromJson<Cell>(request.downloadHandler.text);
                Debug.Log(cell);
                LoadCells(CurrentGrid.gridCityId);
            }
            catch (Exception ex)
            {
                Debug.LogError($"Failed to parse grid data: {ex.Message}");
            }
    }
}