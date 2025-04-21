<?php 
include 'db_connect.php'; 
$registration_id = $_GET['registration_id']; 
$sql_result = "SELECT score FROM results WHERE registration_id 
= '$registration_id'"; 
$result_result = mysqli_query($conn, $sql_result); 
$row_result = mysqli_fetch_assoc($result_result); 
$score = $row_result ? $row_result['score'] : 0; 
$sql_course = "SELECT course_id FROM course_registrations WHERE id = 
'$registration_id'"; 
$result_course = mysqli_query($conn, $sql_course); 
$course_row = mysqli_fetch_assoc($result_course); 
$course_id = $course_row['course_id']; 
$sql_questions = "SELECT COUNT(*) AS total_questions FROM 
questions WHERE course_id = $course_id"; 
$result_questions = mysqli_query($conn, $sql_questions); 
$row_questions = mysqli_fetch_assoc($result_questions); 
$total_questions = $row_questions ? 
$row_questions['total_questions'] : 0; 
mysqli_close($conn); 
?> 
<!DOCTYPE html> 
<html lang="en"> 
<head> 
     <title>Exam Result</title> 
    <link rel="stylesheet" href="submit.css"> 
</head> 
<body> 
    <div class="result-container"> 
        <h2>Exam Results</h2> 
        <p>You scored <strong><?php echo 
htmlspecialchars($score); ?></strong> out of <strong><?php 
echo htmlspecialchars($total_questions); ?></strong>.</p> 
        <?php if ($score == $total_questions): ?> 
            <p class="perfect-score">Congratulations! You answered all 
the questions correctly!</p> 
        <?php elseif ($score > $total_questions / 2): ?> 
            <p class="good-score">Good job! You passed the exam!</p> 
        <?php else: ?> 
            <p class="poor-score">Better luck next time. Keep 
practicing!</p> 
        <?php endif; ?> 
         <a href="dashboard.php" class="btn">Go Back</a> 
    </div> 
</body> 
</html>