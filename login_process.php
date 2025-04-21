<?php 
session_start(); 
include ('db_connect.php'); 
$email = $_POST['email']; 
$password = $_POST['password']; 
$error_message = ""; 
$query = "SELECT * FROM student_registration WHERE email = ?"; 
$stmt = mysqli_prepare($conn, $query); 
mysqli_stmt_bind_param($stmt, 's', $email); 
mysqli_stmt_execute($stmt); 
$result = mysqli_stmt_get_result($stmt); 
$row = mysqli_fetch_assoc($result); 
if ($row) { 
    if ($password == $row['password']) { 
        $_SESSION['student_id'] = $row['id']; 
        $_SESSION['student_name'] = $row['name']; 
        header("Location: dashboard.php"); 
        exit(); 
    } else { 
        $error_message = "Invalid email or password"; 
    } 
} else { 
    $error_message = "Invalid email or password"; 
} 
mysqli_close($conn); 
?> 
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <title>Login</title> 
    <link rel="stylesheet" href="login_process.css"> 
</head> 
<body> 
    <div class="login-container"> 
        <?php if ($error_message): ?> 
            <p class="error-message"><?php echo 
htmlspecialchars($error_message); ?></p> 
            <a href="login.html" class="go-back-button">Go Back</a> 
        <?php else: ?> 
            <h2>Login</h2> 
            <form action="login_process.php" method="POST"> 
                <label for="email">Email:</label> 
                <input type="email" name="email" id="email" required> 
                <label for="password">Password:</label> 
                <input type="password" name="password" 
id="password" required> 
                <input type="submit" value="Login"> 
            </form> 
        <?php endif; ?> 
    </div> 
</body> 
</html>