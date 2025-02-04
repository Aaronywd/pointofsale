<?php
include("server/connection.php");

if (!isset($_GET['token'])) {
    echo "<script>
        alert('Invalid reset link.');
        window.location.href = 'index.php';
    </script>";
    exit();
}

$token = $_GET['token'];
$current_time = date('Y-m-d H:i:s');

// Check if token exists and is valid
$query = "SELECT id, username FROM users WHERE reset_token = ? AND reset_token_expires > ?";
$stmt = $db->prepare($query);
$stmt->bind_param("ss", $token, $current_time);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    echo "<script>
        alert('Invalid or expired reset link. Please request a new password reset.');
        window.location.href = 'index.php';
    </script>";
    exit();
}

$user = $result->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['reset_password'])) {
    // Validate CSRF token
    if (!isset($_POST['csrf_token']) || !isset($_SESSION['csrf_token']) || 
        !hash_equals($_SESSION['csrf_token'], $_POST['csrf_token'])) {
        echo "<script>
            alert('Security validation failed. Please try again.');
            window.location.href = '" . $_SERVER['HTTP_REFERER'] . "';
        </script>";
        exit();
    }

    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];

    if ($password !== $confirm_password) {
        echo "<script>
            alert('Passwords do not match. Please try again.');
            window.location.href = '" . $_SERVER['HTTP_REFERER'] . "';
        </script>";
        exit();
    }

    // Update password and clear reset token
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);
    $query = "UPDATE users SET password = ?, reset_token = NULL, reset_token_expires = NULL WHERE id = ?";
    $stmt = $db->prepare($query);
    $stmt->bind_param("si", $hashed_password, $user['id']);
    
    if ($stmt->execute()) {
        echo "<script>
            alert('Password has been reset successfully. You can now login with your new password.');
            window.location.href = 'index.php';
        </script>";
        exit();
    } else {
        echo "<script>
            alert('Failed to reset password. Please try again.');
            window.location.href = '" . $_SERVER['HTTP_REFERER'] . "';
        </script>";
        exit();
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <?php include('templates/head.php'); ?>
    <script src="bootstrap4/jquery/sweetalert.min.js"></script>
    <title>Reset Password</title>
</head>
<body class="bg-dark">
    <div class="text-center border border-dark">
        <div class="main">
            <img class="img-fluid" src="images/storehub.png"/>
            <div class="container mt-4 mb-4">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card bg-warning">
                            <div class="card-header bg-warning border-0">
                                <h4 class="mb-0 text-dark"><i class="fas fa-key"></i> Reset Password</h4>
                            </div>
                            <div class="card-body">
                                <form method="post">
                                    <?php echo csrf_field(); ?>
                                    <div class="form-group">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text bg-dark text-white"><i class="fas fa-lock"></i></span>
                                            </div>
                                            <input type="password" 
                                                   name="password" 
                                                   id="password"
                                                   class="form-control" 
                                                   placeholder="Enter New Password"
                                                   required
                                                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                                   title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                                            <div class="input-group-append">
                                                <button class="btn btn-outline-dark" type="button" onclick="togglePassword('password')">
                                                    <i class="fas fa-eye" id="passwordIcon"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <small class="form-text text-dark">
                                            Password must contain at least 8 characters, including uppercase, lowercase letters and numbers.
                                        </small>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text bg-dark text-white"><i class="fas fa-lock"></i></span>
                                            </div>
                                            <input type="password" 
                                                   name="confirm_password" 
                                                   id="confirm_password"
                                                   class="form-control" 
                                                   placeholder="Confirm New Password"
                                                   required>
                                            <div class="input-group-append">
                                                <button class="btn btn-outline-dark" type="button" onclick="togglePassword('confirm_password')">
                                                    <i class="fas fa-eye" id="confirm_passwordIcon"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" name="reset_password" class="btn btn-dark btn-lg">
                                            <i class="fas fa-save"></i> Reset Password
                                        </button>
                                        <a href="index.php" class="btn btn-dark btn-lg">
                                            <i class="fas fa-arrow-left"></i> Back to Login
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="bootstrap4/jquery/jquery.min.js"></script>
    <script src="bootstrap4/js/bootstrap.bundle.min.js"></script>
    <script>
        function togglePassword(inputId) {
            const passwordInput = document.getElementById(inputId);
            const icon = document.getElementById(inputId + 'Icon');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }
    </script>
</body>
</html>
