<?php 
include 'db_connect.php'; 
if ($_SERVER["REQUEST_METHOD"] == "POST") { 
    $registration_id = $_POST['registration_id']; 
    $answers = $_POST['answers']; 
    $score = 0; 
    $total_questions = 0; 
    $sql_course = "SELECT course_id FROM course_registrations WHERE id 
= '$registration_id'"; 
    $result_course = mysqli_query($conn, $sql_course); 
    $course_row = mysqli_fetch_assoc($result_course); 
    $course_id = $course_row['course_id'];    
    $sql = "SELECT * FROM questions WHERE course_id = 
$course_id"; 
    $result = mysqli_query($conn, $sql); 
    if ($result) { 
        while ($row = mysqli_fetch_assoc($result)) { 
            $total_questions++; 
            $question_id = $row['id']; 
            $correct_option = $row['correct_option']; 
            if (isset($answers[$question_id]) && 
$answers[$question_id] == $correct_option) { 
                $score++; 
            } 
        } 
    } else { 
        echo "Error fetching questions: " . mysqli_error($conn); 
    }  
    $sql_result = "INSERT INTO results (student_id, registration_id, 
score) VALUES ((SELECT student_id FROM course_registrations WHERE id = '$registration_id'), '$registration_id', '$score') 
ON DUPLICATE KEY UPDATE score = VALUES(score)"; 
    if (mysqli_query($conn, $sql_result)) { 
        header("Location: submit_result.php?registration_id=$registration_id"); 
    } else { 
        echo "Error: " . mysqli_error($conn); 
    } 
    mysqli_close($conn); 
} 
?>