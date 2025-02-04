<?php
include("../server/connection.php");

if(isset($_GET['id'])){
	$id = $_GET['id'];
	$user = $_SESSION['username'];

	// Get supplier name for logging
	$stmt = $db->prepare("SELECT company_name FROM supplier WHERE supplier_id = ?");
	$stmt->bind_param("i", $id);
	$stmt->execute();
	$result = $stmt->get_result();
	$supplier = $result->fetch_assoc();

	// Delete supplier
	$stmt = $db->prepare("DELETE FROM supplier WHERE supplier_id = ?");
	$stmt->bind_param("i", $id);
	
	if($stmt->execute()){
		// Log the deletion
		$stmt = $db->prepare("INSERT INTO logs (username, purpose) VALUES (?, ?)");
		$purpose = "Deleted supplier: " . $supplier['company_name'];
		$stmt->bind_param("ss", $user, $purpose);
		$stmt->execute();

		header('location: supplier.php?deleted');
		exit();
	}else{
		header('location: supplier.php?error');
		exit();
	}
}