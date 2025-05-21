import './style.css'
import {BaseData, setupGrid} from './setup.ts'
import {getGridFieldCluster} from "./grid.ts";

console.log(BaseData);

document.querySelector<HTMLDivElement>('#app')!.innerHTML = `
  <div>
    <h1>SCC Simulation Tool</h1>
    
    <p>Base Data</p>
    <span><strong>X: </strong> 10</span> <span><strong>Y: </strong> 10</span>
    <button id="create-cluster">create cluster</button>
    
    
    <section id="grid-section"></section>
    
    <div id="resource-filters">
        <button data-resource="oil">Oil</button>
        <button data-resource="iron">Iron</button>
        <button data-resource="water">Water</button>
        <button data-resource="all">All</button>
    </div>
  </div>
`;

setupGrid(document.querySelector<HTMLDivElement>('#grid-section')!);
getGridFieldCluster(document.querySelector<HTMLButtonElement>('#create-cluster')!);
