<?php 
session_start(); 
if (!isset($_SESSION['student_id'])) { 
    header("Location: login.php"); 
    exit(); 
} 
include('db_connect.php'); 
$student_id = $_SESSION['student_id']; 
$course_id = $_POST['course_id']; 
$check_query = "SELECT * FROM course_registrations WHERE 
student_id='$student_id' AND course_id='$course_id'"; 
$check_result = mysqli_query($conn, $check_query); 
if (mysqli_num_rows($check_result) > 0) { 
    echo "You are already registered for this course."; 
} else { 
    $query = "INSERT INTO course_registrations (student_id, course_id) 
VALUES ('$student_id', '$course_id')"; 
    if (mysqli_query($conn, $query)) { 
        echo "Course registered successfully!"; 
    } else { 
        echo "Error: " . mysqli_error($conn); 
    } 
} 
header("Location: dashboard.php"); 
?>