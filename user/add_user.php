<?php 
	include('../user/add.php');
	include '../set.php';
?>
<!DOCTYPE html>
<html>
<head>
	<?php include('../templates/head1.php');?>
	<style type="text/css">
		.field-icon {
			float: right;
			margin-left: -20px;
			margin-top: 8px;
			margin-right: 4px;
			position: relative;
			z-index: 2;
		}
		/* Password validation styles */
		#password-strength {
			display: none;
			margin-top: 5px;
			padding: 5px;
			color: #555;
			font-size: 12px;
		}
		.password-criteria {
			margin: 2px 0;
		}
		.criteria-met {
			color: green;
		}
		.criteria-not-met {
			color: red;
		}
		.password-match-message {
			font-size: 12px;
			margin-top: 5px;
		}
	</style>
</head>
<body>
	<div class="contain h-100">
		<?php include('../user/base.php');?>
		<div class="main">
			<div class="side">
				<h1 class="ml-4 pt-2"><i class="fas fa-users"></i> User Management</h1>
				<hr>
			</div>
			<div class="first_side ml-5 mt-5 mr-3">
				<div style="border:1px dashed black; width: 250px;height: 250px;">
					<img class="img-fluid p-2 h-100 w-100" src="../images/user.png">
				</div>
			<form method="post" enctype="multipart/form-data">
				<?php echo csrf_field(); ?>
				<input type="hidden" name="size" class="form-control-sm" value="1000000">
				<input class="form-control-sm" type="file" name="image" required>
			</div>
			<div class="second_side ml-4">
					<table class="table-responsive mt-5">
						<p><?php include('../error.php');?></p>
						<tbody>
							<tr>
								<td  valign="baseline">Username:</td>
								<td class="pl-5 pb-2"><div class="input-group"><div class="input-group-prepend"><span class="input-group-text" id="basic-addon1"><i class="fas fa-user-circle"></i></span></div><input type="text" name="username" pattern="[a-z0-9]{1,15}" title="Username should contain lowercase or letters. e.g. john12" class="form-control form-control-sm" placeholder="Enter Username" required></div></td>
							</tr>
							<tr>
								<td  valign="baseline">Firstname:</td>
								<td class="pl-5 pb-2"><div class="input-group"><div class="input-group-prepend"><span class="input-group-text" id="basic-addon1"><i class="fas fa-pen-alt"></i></span></div><input type="text" name="firstname" title="Name must not contain numbers or spaces. e.g John12" class="form-control form-control-sm" placeholder="Enter Firstname" pattern="[A-Za-z]+" required></div></td>
							</tr>
							<tr>
								<td  valign="baseline">Lastname:</td>
								<td class="pl-5 pb-2"><div class="input-group"><div class="input-group-prepend"><span class="input-group-text" id="basic-addon1"><i class="fas fa-pen-alt"></i></span></div><input type="text" name="lastname" pattern="[A-Za-z]+" title="Name must not contain numbers or spaces e.g John12" class="form-control form-control-sm" placeholder="Enter Lastname" required></div></td>
							</tr>
							<tr>
								<td  valign="baseline">Contact number:</td>
								<td class="pl-5 pb-2">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"><i class="fas fa-phone"></i></span>
										</div>
										<input type="tel" 
											name="number" 
											pattern="^(01[0-9]-|\+6001[0-9]|\+60|0)[0-9]{7,8}$"
											title="Please enter a valid Malaysian phone number (e.g., 012-3456789 or 03-12345678)" 
											class="form-control form-control-sm" 
											placeholder="e.g., 012-3456789" 
											required
										>
									</div>
									<small class="text-muted">Format: 01x-xxxxxxx (mobile) or 0x-xxxxxxxx (landline)</small>
								</td>
							</tr>
							<tr>
								<td  valign="baseline">Email:</td>
								<td class="pl-5 pb-2">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"><i class="fas fa-envelope"></i></span>
										</div>
										<input type="email" 
											name="email" 
											class="form-control form-control-sm" 
											placeholder="Enter your email address"
											pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
											title="Please enter a valid email address (e.g., user@example.com)"
											required
										>
									</div>
									<small class="text-muted">Enter a valid email address (e.g., user@example.com)</small>
								</td>
							</tr>
							<tr>
								<td  valign="baseline">Password:</td>
								<td class="pl-5 pb-2">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"><i class="fas fa-key"></i></span>
										</div>
										<input type="password" 
											name="password" 
											class="form-control form-control-sm" 
											id="password-field" 
											pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
											title="Password must contain at least 8 characters, including uppercase, lowercase, number and special character"
											placeholder="Enter Password" 
											required
										>
										<span toggle="#password-field" class="fa fa-sm fa-eye field-icon toggle-password"></span>
									</div>
									<div id="password-strength">
										<div class="password-criteria" id="length">• 8+ characters</div>
										<div class="password-criteria" id="uppercase">• 1 uppercase letter</div>
										<div class="password-criteria" id="lowercase">• 1 lowercase letter</div>
										<div class="password-criteria" id="number">• 1 number</div>
										<div class="password-criteria" id="special">• 1 special character</div>
									</div>
								</td>
							</tr>
							<tr>
								<td  valign="baseline">Confirm Password:</td>
								<td class="pl-5 pb-2">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"><i class="fas fa-key"></i></span>
										</div>
										<input type="password" 
											name="password1" 
											id="password-field1" 
											class="form-control form-control-sm" 
											placeholder="Confirm Password" 
											required
										>
										<span toggle="#password-field1" class="fa fa-sm fa-eye field-icon toggle-password"></span>
									</div>
									<div class="password-match-message" id="password-match"></div>
								</td>
							</tr>
							<tr>
								<td  valign="baseline">Position:</td>

								<td class="pl-5 pb-2">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1">
											<i class="fas fa-user-tag"></i></span>
										</div>
										<select name="position" class="form-control-sm form-control" required>
											<option value="Admin">Admin</option>
											<option value="Employee">Employee</option>
										</select>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="text-left mt-4">
						<button type="submit" name="add" class="btn btn-secondary"><i class="fas fa-check-circle"></i> Submit</button>
						<button class="btn btn-danger" onclick="window.location.href='../user/user.php'" ><i class="fas fa-ban"></i> Cancel</button>
					</div>
				</form>
			</div>
		</div> 
	</div>
	<script src="../bootstrap4/jquery/jquery.min.js"></script>

	<script src="../bootstrap4/js/bootstrap.bundle.min.js"></script>
	<script>
	$(document).ready(function() {
		// Toggle password visibility
		$(".toggle-password").click(function() {
			$(this).toggleClass("fa-eye fa-eye-slash");
			var input = $($(this).attr("toggle"));
			if (input.attr("type") == "password") {
				input.attr("type", "text");
			} else {
				input.attr("type", "password");
			}
		});

		// Password validation
		$('#password-field').on('input', function() {
			var password = $(this).val();
			$('#password-strength').show();

			// Check each criteria
			var hasLength = password.length >= 8;
			var hasUpper = /[A-Z]/.test(password);
			var hasLower = /[a-z]/.test(password);
			var hasNumber = /\d/.test(password);
			var hasSpecial = /[@$!%*?&]/.test(password);

			// Update criteria status
			$('#length').toggleClass('criteria-met', hasLength).toggleClass('criteria-not-met', !hasLength);
			$('#uppercase').toggleClass('criteria-met', hasUpper).toggleClass('criteria-not-met', !hasUpper);
			$('#lowercase').toggleClass('criteria-met', hasLower).toggleClass('criteria-not-met', !hasLower);
			$('#number').toggleClass('criteria-met', hasNumber).toggleClass('criteria-not-met', !hasNumber);
			$('#special').toggleClass('criteria-met', hasSpecial).toggleClass('criteria-not-met', !hasSpecial);
		});

		// Password match validation
		$('#password-field1').on('input', function() {
			var password = $('#password-field').val();
			var confirmPassword = $(this).val();
			var matchMessage = $('#password-match');

			if (confirmPassword === '') {
				matchMessage.text('').removeClass('criteria-met criteria-not-met');
			} else if (password === confirmPassword) {
				matchMessage.text('Passwords match').addClass('criteria-met').removeClass('criteria-not-met');
			} else {
				matchMessage.text('Passwords do not match').addClass('criteria-not-met').removeClass('criteria-met');
			}
		});

		// Phone number formatting
		$('input[name="number"]').on('input', function() {
			var number = $(this).val().replace(/\D/g, ''); // Remove non-digits
			if (number.length >= 3) {
				// Format as 01x-xxxxxxx or 0x-xxxxxxxx
				if (number.startsWith('01')) {
					// Mobile number
					if (number.length > 3) {
						number = number.slice(0, 3) + '-' + number.slice(3);
					}
				} else if (number.startsWith('0')) {
					// Landline
					if (number.length > 2) {
						number = number.slice(0, 2) + '-' + number.slice(2);
					}
				}
			}
			$(this).val(number);
		});

		// Form submission validation
		$('form').on('submit', function(e) {
			var password = $('#password-field').val();
			var confirmPassword = $('#password-field1').val();

			if (password !== confirmPassword) {
				e.preventDefault();
				alert('Passwords do not match!');
				return false;
			}

			// Validate password criteria
			var isValid = true;
			var errorMessage = '';

			if (password.length < 8) {
				isValid = false;
				errorMessage += '- Password must be at least 8 characters long\n';
			}
			if (!/[A-Z]/.test(password)) {
				isValid = false;
				errorMessage += '- Password must contain at least one uppercase letter\n';
			}
			if (!/[a-z]/.test(password)) {
				isValid = false;
				errorMessage += '- Password must contain at least one lowercase letter\n';
			}
			if (!/\d/.test(password)) {
				isValid = false;
				errorMessage += '- Password must contain at least one number\n';
			}
			if (!/[@$!%*?&]/.test(password)) {
				isValid = false;
				errorMessage += '- Password must contain at least one special character (@$!%*?&)\n';
			}

			if (!isValid) {
				e.preventDefault();
				alert('Password requirements not met:\n' + errorMessage);
				return false;
			}

			// Phone validation
			var phoneNumber = $('input[name="number"]').val();
			var phonePattern = /^(01[0-9]-|\+6001[0-9]|\+60|0)[0-9]{7,8}$/;
			
			if (!phonePattern.test(phoneNumber)) {
				e.preventDefault();
				alert('Please enter a valid Malaysian phone number\nExample formats:\n- Mobile: 012-3456789\n- Landline: 03-12345678');
				return false;
			}
		});
	});
	</script>
</body>
</html>