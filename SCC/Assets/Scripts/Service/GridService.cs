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
                var cellWrapper = JsonUtility.FromJson<CellListWrapper>("{\"cells\":" + request.downloadHandler.text + "}");                Debug.Log(cellWrapper);
                CurrentGrid.cells = cellWrapper.cells;
            }
            catch (Exception ex)
            {
                Debug.LogError($"Failed to parse grid data: {ex.Message}");
            }
        }

        public async void UpdateCell(int x, int y, int buildingId, int cityId)
        {
            var newCell = new Cell
            {
                x= x,
                y= y,
                cityId= cityId,
                buildingId = buildingId
            };

            var jsonCell = JsonUtility.ToJson(newCell);
            byte[] cellData = System.Text.Encoding.UTF8.GetBytes(jsonCell);

            var request = UnityWebRequest.Put(BaseUrl + "/grid/cell", cellData).AddGameAuth();
            request.SetRequestHeader("Content-Type", "application/json");
            request.SendWebRequest();

            while (!request.isDone)
            {
                await Task.Yield();
            }

            if (request.result != UnityWebRequest.Result.Success)
            {
                Debug.Log(request.result);
                Debug.Log("Fail to update cell");
                return;
            }

            try
            {
                //Todo: add that cell object gets retruned after update
                LoadCells(CurrentGrid.gridCityId);
            }
            catch (Exception ex)
            {
                Debug.LogError($"Failed to parse grid data: {ex.Message}");
            }
        }

        public (int newX, int newY) ConvertCoordinate(int oldX, int oldY)
        {
            var newX = Mathf.RoundToInt(oldX + 50);
            var newY = Mathf.RoundToInt(oldY + 50);
            return (newX, newY);
        }
    }
}