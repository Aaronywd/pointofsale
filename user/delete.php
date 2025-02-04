<?php 
include('../server/connection.php');

if(isset($_GET['id'])){ 
    $id = $_GET['id'];
    $user = $_SESSION['username'];
    
    // First get the username of the user being deleted for logging
    $get_username = $db->prepare("SELECT username FROM users WHERE id = ?");
    $get_username->bind_param("i", $id);
    $get_username->execute();
    $result = $get_username->get_result();
    $row = $result->fetch_assoc();
    $deleted_user = $row['username'];
    
    // Delete the user
    $query = $db->prepare("DELETE FROM users WHERE id = ?");
    $query->bind_param("i", $id);
    
    if($query->execute()){
        // Log with more detailed information
        $insert = $db->prepare("INSERT INTO logs (username, purpose) VALUES (?, ?)");
        $purpose = "Deleted user: " . $deleted_user;
        $insert->bind_param("ss", $user, $purpose);
        $insert->execute();
        
        header("location: user.php?deleted");
        exit();
    } else {
        header("location: user.php?undelete");
        exit();
    }
}