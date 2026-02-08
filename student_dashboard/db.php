<?php
$conn = new mysqli("localhost", "root", "", "dashboard_db");

if ($conn->connect_error) {
    die("Database Connection Failed: " . $conn->connect_error);
}
?>
