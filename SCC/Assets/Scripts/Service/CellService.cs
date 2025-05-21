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

        public string zoneType;
        public int population;
        public int pollution;
        public int availableWorkers;
        public Dictionary<string, int> availableGoods;
        public bool isPowered;
        public bool isAdjacentToPowerline;
    }

    public class CellService : MonoBehaviour
    {
        public static CellService Instance { get; private set; }
        public List<Cell> CurrentCellList;
        private const string BaseUrl = GameConfig.MapServiceBaseUrl;
        private GridService _gridService;

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

            _gridService = GridService.Instance;
        }

        public async Task<bool> AddResourceToGrid(int cityId)
        {
            var request = UnityWebRequest.Get(BaseUrl + "/add-resource-grid").AddGameAuth();
            request.SetRequestHeader("cityId", cityId.ToString());
            request.SendWebRequest();

            while (!request.isDone)
            {
                await Task.Yield();
            }

            if (request.result != UnityWebRequest.Result.Success)
            {
                Debug.Log("Fail to add resource to grid");
                return false;
            }


            if (request.result == UnityWebRequest.Result.Success)
            {
                var res = await LoadCells(cityId);
                Debug.Log(CurrentCellList);

                foreach (var cell in CurrentCellList)
                {
                    Debug.Log("a: " + cell.availableGoods);
                }
                
                return res;
            }

            return false;
        }
        
        public async Task<bool> LoadCells(int cityId)
        {
            var request = UnityWebRequest.Get(BaseUrl + "/cells").AddGameAuth();
            request.SetRequestHeader("cityId", cityId.ToString());
            request.SendWebRequest();

            while (!request.isDone)
            {
                await Task.Yield();
            }

            if (request.result != UnityWebRequest.Result.Success)
            {
                Debug.Log("Fail to load grid");
                return false;
            }

            try
            {
                List<Cell> cellList = ParseCellList(request.downloadHandler.text);
                _gridService.CurrentGrid.cells = cellList;
                
                foreach (var cell in cellList)
                {
                    Debug.Log(cell.availableGoods);
                }
                
                return true;
            }
            catch (Exception ex)
            {
                Debug.LogError($"Failed to parse grid data: {ex.Message}");
                return false;
            }
        }

        [Serializable]
        private class CellArrayWrapper
        {
            public Cell[] array;
        }

        
        private List<Cell> ParseCellList(string json)
        {
            string wrappedJson = "{\"array\":" + json + "}";
            CellArrayWrapper wrapper = JsonUtility.FromJson<CellArrayWrapper>(wrappedJson);
            return new List<Cell>(wrapper.array);
        }
    }
}
