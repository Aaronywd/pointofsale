<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$database	= 'PointOfSale';
$username	= 'root';
$host		= 'localhost';
$password	= '';
$msg 		= '';

ini_set('display_errors',1);
error_reporting(E_ALL);
mysqli_report(MYSQLI_REPORT_ERROR | E_DEPRECATED);

$db 	= mysqli_connect($host,$username,$password,$database);

if($db == false){
	die("Connection Failed: ".mysqli_connect_error());
}

// Initialize CSRF token if not exists
if (!isset($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!isset($_POST['csrf_token']) || !isset($_SESSION['csrf_token']) || 
        !hash_equals($_SESSION['csrf_token'], $_POST['csrf_token'])) {
        if (isset($_POST['add']) || isset($_POST['login'])) {
            $_SESSION['error'] = 'CSRF validation failed. Please try again.';
            header('Location: ' . $_SERVER['HTTP_REFERER']);
            exit();
        }
    }
}

if (!function_exists('csrf_field')) {
    function csrf_field() {
        if (!isset($_SESSION['csrf_token'])) {
            $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
        }
        return '<input type="hidden" name="csrf_token" value="' . $_SESSION['csrf_token'] . '">';
    }
}

// List of files that should be excluded from CSRF check
$csrf_excluded_files = [
    'login.php',
    'fetch_all.php',  // For DataTables
    'fetch.php',      // For DataTables
    'view_cashflow.php', // For AJAX modals
    'update.php',
];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $current_file = basename($_SERVER['PHP_SELF']);
    // Skip CSRF check for excluded files and AJAX requests
    if (!in_array($current_file, $csrf_excluded_files) && 
        (!isset($_SERVER['HTTP_X_REQUESTED_WITH']) || strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) != 'xmlhttprequest')) {
        if (!isset($_POST['csrf_token']) || !hash_equals($_SESSION['csrf_token'], $_POST['csrf_token'])) {
            die('CSRF token validation failed');
        }
    }
}

if (isset($_POST['logout'])){
	$user = $_SESSION['username'];
	$insert	= "INSERT INTO logs (username,purpose) VALUES('$user','User $user logout')";
 	$logs = mysqli_query($db,$insert);
	session_destroy();
	unset($_SESSION['username']);
	header('location: ../index.php');
}
