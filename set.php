<?php 
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if(!isset($_SESSION['username']) || !isset($_SESSION['position'])){
    header('location: ../index.php');
    exit();
}

// Check if user is trying to access admin pages
$current_path = $_SERVER['PHP_SELF'];
if (strpos($current_path, '/user/') !== false || 
    strpos($current_path, '/supplier/') !== false || 
    strpos($current_path, '/products/') !== false ||
    strpos($current_path, '/cashflow/') !== false ||
    strpos($current_path, '/customer/') !== false ||
    strpos($current_path, '/delivery/') !== false ||
    strpos($current_path, '/logs/') !== false ||
    strpos($current_path, 'main.php') !== false) {
    
    if ($_SESSION['position'] !== 'admin') {
        header('location: ../employee_page.php');
        exit();
    }
}

// Check if user is trying to access employee pages
if (strpos($current_path, 'employee_page.php') !== false) {
    if ($_SESSION['position'] !== 'employee') {
        header('location: ../main.php');
        exit();
    }
}
?>