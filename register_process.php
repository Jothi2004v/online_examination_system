<?php 
include ('db_connect.php'); 
$name = $_POST['name']; 
$email = $_POST['email']; 
$password = $_POST['password'];

$query = "INSERT INTO student_registration (name, email, password) 
VALUES ('$name', '$email', '$password')"; 
if (mysqli_query($conn, $query)) { 
    header("Location: login.html"); 
    exit(); 
} else { 
    echo "Error: " . mysqli_error($conn); 
}
?>