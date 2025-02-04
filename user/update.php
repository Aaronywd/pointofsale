<?php
	include("../server/connection.php");
	$msg 		= '';
  	if(isset($_POST['update'])){
		$id       	= $_POST['id'];
	  	$firstname  = $_POST['firstname'];
	  	$lastname   = $_POST['lastname'];
	  	$position  	= $_POST['position'];
	  	$username   = $_POST['username'];
	  	$email      = $_POST['email'];
	  	$number   	= $_POST['number'];
	  	$image    	= $_FILES['image']['name'];
	  	$target   	= "../images/".basename($_FILES['image']['tmp_name']);
	  	$user 		= $_SESSION['username'];

		// Check if email exists for other users
		$stmt = $db->prepare("SELECT id FROM users WHERE email = ? AND id != ?");
		$stmt->bind_param("si", $email, $id);
		$stmt->execute();
		$result = $stmt->get_result();

		if($result->num_rows > 0){
			$_SESSION['error'] = "Email address already registered by another user";
			header('location: ../user/user.php?error');
			exit();
		}

		if(!empty($image)){
		  	// Update with new image
		  	$stmt = $db->prepare("UPDATE users SET firstname = ?, lastname = ?, position = ?, contact_number = ?, email = ?, image = ? WHERE id = ?");
		  	$stmt->bind_param("ssssssi", $firstname, $lastname, $position, $number, $email, $image, $id);
		  	
		  	if($stmt->execute() && move_uploaded_file($_FILES['image']['tmp_name'], $target)){
		  		// Log the update
		  		$stmt = $db->prepare("INSERT INTO logs (username, purpose) VALUES (?, ?)");
		  		$purpose = "User $firstname updated";
		  		$stmt->bind_param("ss", $user, $purpose);
		  		$stmt->execute();
		  		
		  		header('location: ../user/user.php?updated');
		  		exit();
		  	}else{
		  		$_SESSION['error'] = "Failed to update user. Please try again.";
		  		header('location: ../user/user.php?error');
		  		exit();
		  	}
		}else{
		  	// Update without changing image
		  	$stmt = $db->prepare("UPDATE users SET firstname = ?, lastname = ?, position = ?, contact_number = ?, email = ? WHERE id = ?");
		  	$stmt->bind_param("sssssi", $firstname, $lastname, $position, $number, $email, $id);
		  	
		  	if($stmt->execute()){
		  		// Log the update
		  		$stmt = $db->prepare("INSERT INTO logs (username, purpose) VALUES (?, ?)");
		  		$purpose = "User $firstname updated";
		  		$stmt->bind_param("ss", $user, $purpose);
		  		$stmt->execute();
		  		
		  		header('location: ../user/user.php?updated');
		  		exit();
		  	}else{
		  		$_SESSION['error'] = "Failed to update user. Please try again.";
		  		header('location: ../user/user.php?error');
		  		exit();
		  	}		
 		}
	}
?>