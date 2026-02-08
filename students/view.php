<?php
$conn = mysqli_connect("localhost", "root", "", "student_db");

$result = mysqli_query($conn, "SELECT * FROM students");

echo "<h2>Registered Students</h2>";
echo "<table border='1' cellpadding='10'>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>DOB</th>
            <th>Department</th>
            <th>Phone</th>
        </tr>";

while ($row = mysqli_fetch_assoc($result)) {
    echo "<tr>
            <td>{$row['name']}</td>
            <td>{$row['email']}</td>
            <td>{$row['dob']}</td>
            <td>{$row['department']}</td>
            <td>{$row['phone']}</td>
          </tr>";
}

echo "</table>";

mysqli_close($conn);
?>
