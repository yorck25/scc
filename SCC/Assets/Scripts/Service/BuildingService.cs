using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using UnityEngine;

namespace Service
{
    [Serializable]
    public class Building
    {
        public int id;
        public int type;
        public int ownerId;
        public int cityId;
        public Time createdAt;
    }
    
    [Serializable]
    public class CreateBuildingRequest
    {
        public int id;
        public int type;
        public int buildingId;
    }

    public enum BuildingTypes
    {
        SingleFamilyHome = 1,
        MultiFamilyHome = 2,
    }
    
    public class BuildingService : MonoBehaviour
    {
        public static BuildingService Instance { get; private set; }
        private const string BaseUrl = GameConfig.GameServiceBaseUrl;
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
    }
}
