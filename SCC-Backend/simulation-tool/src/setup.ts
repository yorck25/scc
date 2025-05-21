export let BaseData = {
    "x": 10,
    "y": 10,
};

export function setupGrid(element: HTMLDivElement) {
    for (let i = 0; i < BaseData.x; i++) {
        const newRow = document.createElement("div");
        newRow.id = `row-${i}`;
        newRow.classList.add("row")

        for (let y = 0; y < BaseData.y; y++) {
            const newCol = document.createElement("div");
            newCol.id = `col-${i}-${y}`;
            newCol.innerHTML = `${y}`;
            newRow.appendChild(newCol);
        }

        element.appendChild(newRow);
    }
}