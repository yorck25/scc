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

export function getGridFieldCluster(el: HTMLButtonElement) {
    let cells: ICell[] = [];

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
            let col = '#fff';

            if(cell.availableGoods) {
                col = '#707070';
            }

            updateGridCell(cell.x, cell.y, cell.zoneType, col);
        })
    }

    el.addEventListener('click', fetchData);
}


function updateGridCell(x: number, y: number, text: string, col: string ) {
    const el = document.querySelector<HTMLDivElement>(`#col-${x}-${y}`);

    if (el == null) {
        return;
    }

    el.innerHTML = text.length == 0 ? y.toString() : text[0];
    el.style.backgroundColor = `${col}`
}