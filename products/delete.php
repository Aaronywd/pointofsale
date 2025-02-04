<?php
include("../server/connection.php");

if(isset($_GET['id'])){
	$id = $_GET['id'];
	$user = $_SESSION['username'];

	// Get product name for logging
	$stmt = $db->prepare("SELECT product_name FROM products WHERE product_no = ?");
	$stmt->bind_param("i", $id);
	$stmt->execute();
	$result = $stmt->get_result();
	$product = $result->fetch_assoc();

	// Delete product
	$stmt = $db->prepare("DELETE FROM products WHERE product_no = ?");
	$stmt->bind_param("i", $id);
	
	if($stmt->execute()){
		// Log the deletion
		$stmt = $db->prepare("INSERT INTO logs (username, purpose) VALUES (?, ?)");
		$purpose = "Deleted product: " . $product['product_name'];
		$stmt->bind_param("ss", $user, $purpose);
		$stmt->execute();

		header('location: products.php?deleted');
		exit();
	}else{
		header('location: products.php?undelete');
		exit();
	}
}