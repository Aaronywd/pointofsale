<?php include('../server/connection.php');
	$msg 	= '';
	$error  = array();
	if(isset($_POST['add'])){
		$company 	= $_POST['com_name'];
		$firstname 	= $_POST['firstname'];
		$lastname 	= $_POST['lastname'];
		$address 	= $_POST['address'];
		$number 	= $_POST['number'];
	  	$image    	= $_FILES['image']['name'];
		$target   	= "../images/".basename($_FILES['image']['name']);
		$user 		= $_SESSION['username'];
		
		if(empty($image)){
			$image = "profile.png";
		}

		$stmt = $db->prepare("INSERT INTO supplier (company_name,firstname,lastname,address,contact_number,image) VALUES (?, ?, ?, ?, ?, ?)");
		$stmt->bind_param("ssssss", $company, $firstname, $lastname, $address, $number, $image);
		
		if($stmt->execute()){
			if(!empty($_FILES['image']['name'])){
				move_uploaded_file($_FILES['image']['tmp_name'], $target);
			}

			$stmt = $db->prepare("INSERT INTO logs (username,purpose) VALUES (?, ?)");
			$purpose = "Supplier $company added";
			$stmt->bind_param("ss", $user, $purpose);
			$stmt->execute();

			header('location: ../supplier/supplier.php?added');
			exit();
		}else{
			header('location: ../supplier/add.php?error');
			exit();
		}
	}
