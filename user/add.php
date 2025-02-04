<?php include('../server/connection.php');
	$msg 	= '';
	$error  = array();
	if(isset($_POST['add'])){
		$user 	= $_SESSION['username'];  
		$username = $_POST['username'];
		$firstname = $_POST['firstname'];
		$lastname = $_POST['lastname'];
		$number = $_POST['number'];
		$email = $_POST['email'];
		$position = $_POST['position'];
		$password = $_POST['password'];
		$password1 = $_POST['password1'];
	  	$image    = $_FILES['image']['name'];
		$target   = "../images/".basename($_FILES['image']['name']);

		$stmt = $db->prepare("SELECT username FROM users WHERE username = ?");
		$stmt->bind_param("s", $username);
		$stmt->execute();
		$result = $stmt->get_result();

		if ($result->num_rows > 0){
		  array_push($error, "Username already taken");
		}

		$stmt = $db->prepare("SELECT email FROM users WHERE email = ?");
		$stmt->bind_param("s", $email);
		$stmt->execute();
		$result = $stmt->get_result();

		if ($result->num_rows > 0){
		  array_push($error, "Email address already registered");
		}

		if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
			array_push($error, "Invalid email format");
		}

		if ($password != $password1){
		  array_push($error, "The Password did not match"); 
		}

		if (count($error) == 0){
			$hashed_password = password_hash($password1, PASSWORD_BCRYPT, ['cost' => 12]);
			
			$stmt = $db->prepare("INSERT INTO users (username,firstname,lastname,position,contact_number,email,password,image) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
			$stmt->bind_param("ssssssss", $username, $firstname, $lastname, $position, $number, $email, $hashed_password, $image);
			$result = $stmt->execute();
			if(move_uploaded_file($_FILES['image']['tmp_name'], $target) && $result == true){
				$msg = "Image successfully uploaded!";
				$stmt = $db->prepare("INSERT INTO logs (username,purpose) VALUES (?, ?)");
				$purpose = "User $firstname added";
				$stmt->bind_param("ss", $user, $purpose);
				$stmt->execute();
				header('location: ../user/user.php?added');
	  		}else{
				$msg = "There was a problem uploading the image!";
	  		}
		}
	}
