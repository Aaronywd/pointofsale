<?php 

$error		= array();
$alert 		= array();

if (isset($_POST['changepass'])){
	$username 	= $_SESSION['username'];
	$newpass 	= $_POST['newpass'];
	$confirmpass	= $_POST['confirmpass'];
	
	$stmt = $db->prepare("SELECT * FROM users WHERE username = ?");
	$stmt->bind_param("s", $username);
	$stmt->execute();
	$result = $stmt->get_result();
	$row 		= $result->fetch_assoc();

	if ($newpass !== $confirmpass){
		array_push($error, "The passwords do not match!"); 
	}

	if (password_verify($confirmpass, $row['password'])){
		array_push($error, "The new password cannot be the same as your current password!");
	}

	if (count($error) == 0){
		$hashedPassword = password_hash($confirmpass, PASSWORD_BCRYPT);
		$stmt = $db->prepare("UPDATE users SET password = ? WHERE username = ?");
		$stmt->bind_param("ss", $hashedPassword, $username);
		$stmt->execute();
		array_push($alert, "Password successfully changed!");
	}else{

	}
}