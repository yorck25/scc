using System;
using System.Collections;
using System.Collections.Generic;
using Service;
using UnityEngine;
using Service;

public class GridSystem : MonoBehaviour
{
    public static GridSystem Instance { get; private set; }
    
    public GameObject objectToPlace;
    public bool isBuildModeEnabled = false;
    public float gridSize = 1f;
    
    private GameObject _ghostObject;
    private HashSet<Vector3> _occupiedPositions = new();
    private GameService _gameService;
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
    }
    
    private void Start()
    {
        _gameService = GameService.Instance;
        Create_ghostObject();
    }

    private void Update()
    {
        if (!_gameService.IsBuildModeActive)
        {
            return;
        }
        
        UpdateGhostPosition();

        if (Input.GetMouseButtonDown(0))
        {
            PlaceObject();
        }
    }

    void Create_ghostObject()
    {
        _ghostObject = Instantiate(objectToPlace);
        _ghostObject.GetComponent<Collider>().enabled = false;

        var renderers = _ghostObject.GetComponentsInChildren<Renderer>();
        
        foreach (var ren in renderers)
        {
            var mat = ren.material;
            var color = mat.color;
            color.a = 0.5f;
            mat.color = color;
            
            mat.SetFloat("_Mode", 2);
            mat.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.SrcAlpha);
            mat.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
            mat.SetInt("_ZWrite", 0);
            mat.DisableKeyword("_ALPHATEST_ON");
            mat.EnableKeyword("_ALPHABLEND_ON");
            mat.EnableKeyword("_ALPHAPREMULTIPLY_ON");
            mat.renderQueue = 3000;
        }
    }

    void UpdateGhostPosition()
    {
        var ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        
        if(Physics.Raycast(ray, out RaycastHit hit))
        {
            Vector3 point = hit.point;

            Vector3 snappedPosition = new Vector3(
                Mathf.Round(point.x / gridSize) * gridSize,
                Mathf.Round(point.y / gridSize) * gridSize,
                Mathf.Round(point.z / gridSize) * gridSize
            );

            _ghostObject.transform.position = snappedPosition;

            if (_occupiedPositions.Contains(snappedPosition))
            {
                SetGhostColor(Color.red);
            }
            else
            {
                SetGhostColor(new Color(1f,1f,1f,0.5f));
            }
        }
    }

    void SetGhostColor(Color color)
    {
        var renderers = _ghostObject.GetComponentsInChildren<Renderer>();

        foreach (var renderer in renderers)
        {
            var mat = renderer.material;
            mat.color = color;
        }
    }

    void PlaceObject()
    {
        var placementPosition = _ghostObject.transform.position;

        if (!_occupiedPositions.Contains(placementPosition))
        {
            Instantiate(objectToPlace, placementPosition, Quaternion.identity);
            
            int gridX = Mathf.RoundToInt(placementPosition.x / gridSize);
            int gridZ = Mathf.RoundToInt(placementPosition.z / gridSize);

            (var newX, var newY) = GridService.Instance.ConvertCoordinate(gridX, gridZ);
            
            GridService.Instance.UpdateCell(newX, newY, 1, CityService.Instance.CurrentCity.cityId);
            
            _occupiedPositions.Add(placementPosition);
        }
    }

    public void RenderLoadedGrid(Service.Grid loadedGrid)
    {
        foreach (var cell in loadedGrid.cells)
        {
            if (cell.buildingId != 0)
            {
                Vector3 worldPosition = new Vector3(cell.x - 50, 0, cell.y - 50);

                Instantiate(objectToPlace, worldPosition, Quaternion.identity);
                _occupiedPositions.Add(worldPosition);
            }
        }
    }
}
