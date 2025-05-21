import {BaseData} from "./setup.ts";

export interface ResourceMap {
    oil?: number;
    iron?: number;
    water?: number;
}

export interface ICell {
    cellId: number;
    x: number;
    y: number;
    zoneType: string;
    population: number;
    pollution: number;
    availableWorkers: number;
    availableGoods: ResourceMap;
    isPowered: boolean;
    isAdjacentToPowerline: boolean;
    buildingId: number;
    cityId: number;
}

let cells: ICell[] = [];
let displayType = 'availableGoods';
let selectedResource: keyof ResourceMap | 'all' = 'all';

const resourceColors: { [key in keyof ResourceMap]: string } = {
    oil: '#292929',
    iron: '#acacac',
    water: '#00BFFF',
};

export function getGridFieldCluster(el: HTMLButtonElement) {

    document.querySelectorAll<HTMLButtonElement>('#resource-filters button').forEach(btn => {
        btn.addEventListener('click', () => {
            const resource = btn.dataset.resource as keyof ResourceMap | 'all';
            selectedResource = resource;
            printCells();
        });
    });

    const fetchData = async () => {
        const myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/json");
        myHeaders.append("X", BaseData.x.toString())
        myHeaders.append("Y", BaseData.y.toString())

        let response = await fetch("http://localhost:5655/generate-res-cluster", {
            method: "GET",
            headers: myHeaders
        });
        const json: ICell[] = await response.json();
        console.log(json);
        cells = json;
        updateGridCell(4, 6, "", "#fff");
        printCells();
    }


    const printCells = () => {
        cells.forEach(cell => {
            let text = '';
            let color = '#fff';

            if (displayType === 'availableGoods') {
                const goods = cell.availableGoods;

                if (selectedResource === 'all') {
                    const summary = Object.entries(goods)
                        .filter(([_, value]) => value && value > 0)
                        .map(([key, value]) => `${key[0].toUpperCase()}:${value}`)
                        .join(' ');
                    text = summary;
                    color = '#393939';
                } else {
                    const value = goods[selectedResource] ?? 0;
                    text = value.toString();
                    color = resourceColors[selectedResource] ?? '#fff';
                }
            } else if (displayType === 'cellType') {
                text = cell.zoneType[0];
            }

            updateGridCell(cell.x, cell.y, text, color);
        });
    };

    el.addEventListener('click', fetchData);
}


function updateGridCell(x: number, y: number, text: string, col: string) {
    const el = document.querySelector<HTMLDivElement>(`#col-${x}-${y}`);
    if (!el) return;

    el.innerHTML = text;
    el.style.backgroundColor = col;

    const percent = parseInt(text);
    if (!isNaN(percent)) {
        el.style.opacity = `${Math.max(0.3, percent / 100)}`;
    } else {
        el.style.opacity = '1';
    }
}
