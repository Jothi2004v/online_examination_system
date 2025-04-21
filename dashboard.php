<?php 
session_start(); 
if (!isset($_SESSION['student_id'])) { 
    header("Location: login.html");  
    exit(); 
} 
?> 
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <title>Student Dashboard</title> 
    <link rel="stylesheet" href="dashboard.css"> 
</head> 
<body> 
    <div class="dashboard-container"> 
        <h2>Welcome, <?php echo 
htmlspecialchars($_SESSION['student_name']); ?></h2> 
        <h3>Register for a Course</h3> 
        <form action="register_course.php" method="POST"> 
            <label for="course">Choose a course:</label> 
            <select name="course_id" required> 
                <?php 
                include('db_connect.php'); 
                $query = "SELECT * FROM courses"; 
                $result = mysqli_query($conn, $query); 
                while ($row = mysqli_fetch_assoc($result)) { 
                    echo "<option value='" . htmlspecialchars($row['id']) . 
"'>" . htmlspecialchars($row['course_name']) . "</option>"; 
                } 
                ?> 
            </select> 
            <input type="submit" value="Register"> 
        </form> 
        <h3>Your Registered Courses</h3> 
        <ul class="course-list"> 
            <?php 
            $student_id = $_SESSION['student_id']; 
            $query = "SELECT courses.course_name, course_registrations.id 
FROM course_registrations  
                      JOIN courses ON course_registrations.course_id = courses.id  
                      WHERE course_registrations.student_id = '$student_id'"; 
            $result = mysqli_query($conn, $query); 
            while ($row = mysqli_fetch_assoc($result)) { 
                $registration_id = $row['id']; 
                echo "<li class='course-item'>" . 
htmlspecialchars($row['course_name']) . " 
                      <div class='button-group'> 
                        <a href='exam.php?registration_id=" . 
htmlspecialchars($registration_id) . "' class='btn'>Start Exam</a> 
                        <a href='submit_result.php?registration_id=" . 
htmlspecialchars($registration_id) . "' class='btn-secondary'>See 
Result</a> 
                      </div></li>"; 
            } 
            ?> 
        </ul> 
        <a href="logout.php" class="btn-logout">Logout</a> 
    </div> 
</body> 
</html>