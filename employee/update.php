<?php
	include("../server/connection.php");
	$msg 		= '';
  	if(isset($_POST['update'])){
		// Validate CSRF token
		if (!isset($_POST['csrf_token']) || !isset($_SESSION['csrf_token']) || 
			!hash_equals($_SESSION['csrf_token'], $_POST['csrf_token'])) {
			$_SESSION['error'] = "CSRF token validation failed. Please try again.";
			header('location: ../employee/profile.php?error');
			exit();
		}

		$target   	= "../images/".basename($_FILES['image']['name']);
	  	$image    	= $_FILES['image']['name'];
	  	$id       	= mysqli_real_escape_string($db, $_POST['id']);
	  	$user 		= mysqli_real_escape_string($db, $_POST['username']);	
	  	$firstname  = mysqli_real_escape_string($db, $_POST['firstname']);
	  	$lastname   = mysqli_real_escape_string($db, $_POST['lastname']);
	  	$number   	= mysqli_real_escape_string($db, $_POST['number']);
	  	$email      = mysqli_real_escape_string($db, $_POST['email']);
	  	$position  	= mysqli_real_escape_string($db, $_POST['position']);
	  	$username 	= $_SESSION['username'];

		// Check if email already exists for other users
		$email_check = "SELECT id FROM users WHERE email='$email' AND id != '$id'";
		$result = mysqli_query($db, $email_check);
		if (mysqli_num_rows($result) > 0) {
			$_SESSION['error'] = "Email address already registered by another user";
			header('location: ../employee/profile.php?error');
			exit();
		}

		if (!empty($image)){
		  	$sql  = "UPDATE users SET username='$user',firstname='$firstname',lastname='$lastname',contact_number='$number',email='$email',image='$image' WHERE id = '$id'";
		  	mysqli_query($db, $sql);
		  	if(move_uploaded_file($_FILES['image']['tmp_name'], $target)){
		  		$logs	= "INSERT INTO logs (username,purpose) VALUES('$username','User $firstname updated')";
 				$insert = mysqli_query($db,$logs);
 				header('location: ../employee/profile.php?updated');
 				exit();
 			} else {
 				$_SESSION['error'] = "Failed to update profile. Please try again.";
 				header('location: ../employee/profile.php?error');
 				exit();
 			}
		}else{
		  	$sql  = "UPDATE users SET username='$user',firstname='$firstname',lastname='$lastname',contact_number='$number',email='$email' WHERE id = '$id'";
		  	if(mysqli_query($db, $sql)){
		  		$logs 	= "INSERT INTO logs (username,purpose) VALUES('$username','User $firstname updated')";
 				$insert = mysqli_query($db,$logs);
 				header('location: ../employee/profile.php?updated');
 				exit();
 			} else {
 				$_SESSION['error'] = "Failed to update profile. Please try again.";
 				header('location: ../employee/profile.php?error');
 				exit();
 			}		
 		}
	}