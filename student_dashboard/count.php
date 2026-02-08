<?php
include "db.php";

$sql = "SELECT department, COUNT(*) total FROM student_dashboard GROUP BY department";
$res = $conn->query($sql);

$data=[];
while($row=$res->fetch_assoc()){
    $data[]=$row;
}

echo json_encode($data);
