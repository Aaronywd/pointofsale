<?php
include("server/connection.php");
require 'PHPMailer/PHPMailer/src/Exception.php';
require 'PHPMailer/PHPMailer/src/PHPMailer.php';
require 'PHPMailer/PHPMailer/src/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['forgot_password'])) {
    // Validate CSRF token
    if (!isset($_POST['csrf_token']) || !isset($_SESSION['csrf_token']) || 
        !hash_equals($_SESSION['csrf_token'], $_POST['csrf_token'])) {
        $_SESSION['error'] = "CSRF validation failed. Please try again.";
        header('Location: ' . $_SERVER['HTTP_REFERER']);
        exit();
    }

    $email = mysqli_real_escape_string($db, $_POST['email']);
    $position = mysqli_real_escape_string($db, $_POST['position']);

    // Check if email exists
    $query = "SELECT id, username, firstname, lastname FROM users WHERE email = ? AND position = ?";
    $stmt = $db->prepare($query);
    $stmt->bind_param("ss", $email, $position);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 0) {
        $_SESSION['error'] = "Email not found for the selected account type.";
        echo "<script>
            alert('Email not found for the selected account type.');
            window.location.href = '" . $_SERVER['HTTP_REFERER'] . "';
        </script>";
        exit();
    }

    $user = $result->fetch_assoc();
    
    // Generate reset token
    $token = bin2hex(random_bytes(32));
    $expires = date('Y-m-d H:i:s', strtotime('+1 hour'));
    
    // Save token in database
    $query = "UPDATE users SET reset_token = ?, reset_token_expires = ? WHERE id = ?";
    $stmt = $db->prepare($query);
    $stmt->bind_param("ssi", $token, $expires, $user['id']);
    $stmt->execute();

    // Send email
    $mail = new PHPMailer(true);
    try {
        // Server settings
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'aaronywd1234@gmail.com';
        $mail->Password = 'evjh yzup snau wkro';
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        // Recipients
        $mail->setFrom('noreply@yourstore.com', 'Point of Sale System');
        $mail->addAddress($email, $user['firstname'] . ' ' . $user['lastname']);

        // Content
        $mail->isHTML(true);
        $mail->Subject = 'Password Reset Request';
        $resetLink = "http://{$_SERVER['HTTP_HOST']}/point-of-sale/reset_password.php?token=" . $token;
        
        $mail->Body = "
            <h2>Password Reset Request</h2>
            <p>Dear {$user['firstname']},</p>
            <p>We received a request to reset your password. Click the link below to set a new password:</p>
            <p><a href='{$resetLink}'>{$resetLink}</a></p>
            <p>This link will expire in 1 hour.</p>
            <p>If you didn't request this, you can safely ignore this email.</p>
            <p>Best regards,<br>Point of Sale System</p>
        ";

        $mail->send();
        echo "<script>
            alert('Password reset instructions have been sent to your email.');
            window.location.href = 'index.php';
        </script>";
        exit();

    } catch (Exception $e) {
        echo "<script>
            alert('Failed to send email. Please try again later.');
            window.location.href = '" . $_SERVER['HTTP_REFERER'] . "';
        </script>";
        exit();
    }
}
