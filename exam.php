<?php 
include 'db_connect.php'; 
$registration_id = $_GET['registration_id']; 
$sql_course = "SELECT course_id FROM course_registrations WHERE id = 
'$registration_id'"; 
$result_course = mysqli_query($conn, $sql_course); 
$course_row = mysqli_fetch_assoc($result_course); 
$course_id = $course_row['course_id']; 
$sql = "SELECT * FROM questions WHERE course_id = 
$course_id"; 
$result = mysqli_query($conn, $sql); 
?> 
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <title>Exam Page</title> 
    <link rel="stylesheet" href="exam.css"> 
</head> 
<body> 
    <div class="exam-container"> 
        <h2>Exam Questions</h2> 
        <?php 
        if ($result) { 
            echo '<form method="POST" action="submit_exam.php">'; 
            $question_number = 1; 
            while ($row = mysqli_fetch_assoc($result)) { 
                $question_id = $row['id']; 
                echo '<div>'; 
                echo '<p><strong>Question ' . $question_number . 
':</strong> ' . htmlspecialchars($row['question']) . '</p>'; 
                echo '<input type="radio" name="answers[' . 
$question_id . ']" value="1">' . htmlspecialchars($row['option1']) . 
'<br>'; 
                echo '<input type="radio" name="answers[' . 
$question_id . ']" value="2">' . htmlspecialchars($row['option2']) . 
'<br>'; 
                echo '<input type="radio" name="answers[' . 
$question_id . ']" value="3">' . htmlspecialchars($row['option3']) . 
'<br>'; 
                echo '<input type="radio" name="answers[' . 
$question_id . ']" value="4">' . htmlspecialchars($row['option4']) . 
'<br>'; 
                echo '</div>'; 
                $question_number++; 
            } 
            echo '<input type="hidden" name="registration_id" value="' 
. htmlspecialchars($registration_id) . '">'; 
            echo '<input type="submit" value="Submit">'; 
            echo '</form>'; 
        } else { 
            echo "<p>Error fetching questions: " . mysqli_error($conn) . 
"</p>"; 
        }      
        mysqli_close($conn); 
        ?> 
    </div> 
</body> 
</html>