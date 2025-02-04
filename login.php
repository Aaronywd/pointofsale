<?php 
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
include('server/connection.php');
$error = array();

if (isset($_POST['login'])) {
    $position = mysqli_real_escape_string($db, $_POST['position']); 
    $username = mysqli_real_escape_string($db, $_POST['username']);
    $password = mysqli_real_escape_string($db, $_POST['password']);

    // Validate input
    if (empty($username) || empty($password) || empty($position)) {
        array_push($error, "All fields are required!");
    } else {
        // Check if it's an admin login
        if ($position === 'admin') {
            $query = "SELECT * FROM users WHERE username = ? AND position = 'admin'";
            $stmt = mysqli_prepare($db, $query);
            mysqli_stmt_bind_param($stmt, "s", $username);
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);

            if (mysqli_num_rows($result) === 1) {
                $user = mysqli_fetch_assoc($result);
                // Verify password
                if (password_verify($password, $user['password'])) {
                    $_SESSION['username'] = $user['username'];
                    $_SESSION['position'] = 'admin';
                    
                    // Log the login
                    $log_query = "INSERT INTO logs (username, purpose) VALUES (?, 'Admin login')";
                    $log_stmt = mysqli_prepare($db, $log_query);
                    mysqli_stmt_bind_param($log_stmt, "s", $username);
                    mysqli_stmt_execute($log_stmt);
                    
                    header('location: main.php');
                    exit();
                } else {
                    $_SESSION['error'] = "Invalid admin credentials!";
                    header('location: index.php');
                    exit();
                }
            } else {
                $_SESSION['error'] = "Invalid admin credentials!";
                header('location: index.php');
                exit();
            }
        } else {
            // Regular user login
            $query = "SELECT * FROM users WHERE username = ? AND position = ?";
            $stmt = mysqli_prepare($db, $query);
            mysqli_stmt_bind_param($stmt, "ss", $username, $position);
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);

            if (mysqli_num_rows($result) === 1) {
                $user = mysqli_fetch_assoc($result);
                if (password_verify($password, $user['password'])) {
                    $_SESSION['username'] = $user['username'];
                    $_SESSION['position'] = $position;
                    
                    // Log the login
                    $log_query = "INSERT INTO logs (username, purpose) VALUES (?, 'User login')";
                    $log_stmt = mysqli_prepare($db, $log_query);
                    mysqli_stmt_bind_param($log_stmt, "s", $username);
                    mysqli_stmt_execute($log_stmt);
                    
                    header('location: employee_page.php');
                    exit();
                } else {
                    $_SESSION['error'] = "Invalid username/password!";
                    header('location: index.php');
                    exit();
                }
            } else {
                $_SESSION['error'] = "Invalid username/password!";
                header('location: index.php');
                exit();
            }
        }
    }
}

// If there are errors, redirect back with error messages
if (!empty($error)) {
    $_SESSION['errors'] = $error;
    header('location: index.php');
    exit();
}
?>