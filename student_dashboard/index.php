<!DOCTYPE html>
<html>
<head>
<title>Student Dashboard</title>
<link rel="stylesheet" href="style.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<div class="container">
<h2>📊 Student Dashboard</h2>

<div class="controls">
<input type="text" id="search" placeholder="Search name...">

<select id="sort">
<option value="name">Sort by Name</option>
<option value="date">Sort by Date</option>
</select>

<select id="dept">
<option value="">All</option>
<option>CSE</option>
<option>ECE</option>
<option>IT</option>
</select>
  <button id="okBtn">OK</button>

</div>

<table>
<thead>
<tr>
<th>Name</th>
<th>Department</th>
<th>Date</th>
</tr>
</thead>
<tbody id="data"></tbody>
</table>

<div id="pagination"></div>

<canvas id="chart"></canvas>
</div>

<script>
let page=1;

function loadData(){
let sort=document.getElementById("sort").value;
let dept=document.getElementById("dept").value;
let search=document.getElementById("search").value;

fetch(`fetch.php?sort=${sort}&dept=${dept}&search=${search}&page=${page}`)
.then(r=>r.json())
.then(res=>{
let rows="";
res.data.forEach(d=>{
rows+=`<tr>
<td>${d.name}</td>
<td>${d.department}</td>
<td>${d.join_date}</td>
</tr>`;
});
document.getElementById("data").innerHTML=rows;

let p="";
for(let i=1;i<=res.pages;i++){
p+=`<button onclick="setPage(${i})">${i}</button>`;
}
document.getElementById("pagination").innerHTML=p;
});
}

function setPage(p){page=p;loadData();}

function loadChart(){
fetch("count.php")
.then(r=>r.json())
.then(data=>{
new Chart(document.getElementById("chart"),{
type:"bar",
data:{
labels:data.map(d=>d.department),
datasets:[{label:"Students",data:data.map(d=>d.total)}]
}
});
});
}
document.getElementById("okBtn").onclick = function(){
    page = 1;
    loadData();
};
console.log("Fetching...");

loadData();
loadChart();
</script>

</body>
</html>
