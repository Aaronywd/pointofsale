<?php include('server/connection.php'); ?>
<?php include('login.php');?>
<!DOCTYPE html>
<html>
<head>
	<?php include('templates/head.php'); ?>
	<script src="bootstrap4/jquery/sweetalert.min.js"></script>
</head>
<body class="bg-dark">
	<div class="text-center border border-dark">
		<div class="main">
			<img class="img-fluid" src="images/storehub.png"/>
  			<?php include('error.php');?>
		</div>
		<div class="fixed-bottom mb-2">
			<div class="d-inline">
				<button type="button" id="admin" class="btn-lg btn-warning" data-toggle="modal" data-target=".bd-example-modal-sm"><i class="fas fa-user-tie"></i> Administrator</button>
			</div>
			<div class="d-inline">
				<button type="button" id="user" class="btn-lg btn-warning" data-toggle="modal" data-target="#modal-user"><i class="fas fa-user"></i> User</button>
			</div>
		</div>
	</div>
	<script src="bootstrap4/jquery/jquery.min.js"></script>
	<script src="bootstrap4/js/bootstrap.bundle.min.js"></script>
	<script>
		function togglePassword(inputId) {
			const passwordInput = document.getElementById(inputId);
			const icon = document.getElementById(inputId + 'Icon');
			
			if (passwordInput.type === 'password') {
				passwordInput.type = 'text';
				icon.classList.remove('fa-eye');
				icon.classList.add('fa-eye-slash');
			} else {
				passwordInput.type = 'password';
				icon.classList.remove('fa-eye-slash');
				icon.classList.add('fa-eye');
			}
		}
	</script>
	<?php include('modals/admin_login_modal.php');?>
	<?php include('modals/employee_login_modal.php');?>
</body>
</html>
