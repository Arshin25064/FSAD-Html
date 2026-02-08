<?php
$conn = mysqli_connect("localhost", "root", "", "student_db");

if (!$conn) {
    die("Database connection failed: " . mysqli_connect_error());
}

if (isset($_POST['name'], $_POST['email'], $_POST['dob'], $_POST['department'], $_POST['phone'])) {

    $name = $_POST['name'];
    $email = $_POST['email'];
    $dob = $_POST['dob'];
    $department = $_POST['department'];
    $phone = $_POST['phone'];

    $sql = "INSERT INTO students (name, email, dob, department, phone)
            VALUES ('$name', '$email', '$dob', '$department', '$phone')";

    if (mysqli_query($conn, $sql)) {
        echo "✅Student Registered Successfully";
    } else {
        echo "Error: " . mysqli_error($conn);
    }

} else {
    echo "Please submit the form properly.";
}

mysqli_close($conn);
?>
