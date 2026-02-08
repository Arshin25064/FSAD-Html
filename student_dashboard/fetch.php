<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
header("Content-Type: application/json");

include "db.php";

$sort   = $_GET['sort']   ?? 'name';
$dept   = $_GET['dept']   ?? '';
$search = $_GET['search'] ?? '';
$page   = $_GET['page']   ?? 1;

$page = (int)$page;
if ($page < 1) $page = 1;

$limit  = 5;
$offset = ($page - 1) * $limit;

$where = "WHERE 1=1";

if ($dept !== '') {
    $dept = $conn->real_escape_string($dept);
    $where .= " AND department='$dept'";
}

if ($search !== '') {
    $search = $conn->real_escape_string($search);
    $where .= " AND name LIKE '%$search%'";
}

$order = ($sort === "date") ? "join_date" : "name";

// Count total rows
$totalSql = "SELECT COUNT(*) as total FROM student_dashboard $where";
$totalRes = $conn->query($totalSql);

if (!$totalRes) {
    die("Count Query Failed: " . $conn->error);
}

$totalRow = $totalRes->fetch_assoc();
$total    = $totalRow['total'];
$pages    = ceil($total / $limit);

// Fetch data
$sql = "SELECT * FROM student_dashboard $where ORDER BY $order LIMIT $limit OFFSET $offset";
$res = $conn->query($sql);

if (!$res) {
    die("Data Query Failed: " . $conn->error);
}

$data = [];

while ($row = $res->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode([
    "data"  => $data,
    "pages" => $pages
]);
?>
