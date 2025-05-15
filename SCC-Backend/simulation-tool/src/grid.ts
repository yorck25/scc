import {BaseData} from "./setup.ts";

interface ICell {
    cellId: number;
    x: number;
    y: number;
    zoneType: string;
    population: number;
    pollution: number;
    availableWorkers: number;
    availableGoods: number;
    isPowered: boolean;
    isAdjacentToPowerline: boolean;
    buildingId: number;
    cityId: number;
}

let cells: ICell[] = [];
let displayType = 'availableGoods';

export function getGridFieldCluster(el: HTMLButtonElement) {

    const fetchData = async () => {
        const myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/json");
        myHeaders.append("X", BaseData.x.toString())
        myHeaders.append("Y", BaseData.y.toString())

        let response = await fetch("http://localhost:5655/generate-res", {
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
            let col: string = '#fff';
            let cellText: string = '';

            if (cell.availableGoods) {
                col = '#707070';
            }

            if (displayType == 'availableGoods') {
                cellText = `${cell.availableGoods}`;
            } else if (displayType == 'cellType') {
                cellText = cell.zoneType[0];
            }


            updateGridCell(cell.x, cell.y, cellText, col);
        })
    }

    el.addEventListener('click', fetchData);
}


function updateGridCell(x: number, y: number, text: string, col: string) {
    const el = document.querySelector<HTMLDivElement>(`#col-${x}-${y}`);

    if (el == null) {
        return;
    }

    el.innerHTML = text;
    el.style.backgroundColor = `${col}`;
    el.style.opacity = '100%';

    if (displayType == 'availableGoods' && text != "0") {
        el.style.opacity = `${text}%`;
    }
}