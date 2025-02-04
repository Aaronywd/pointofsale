<?php
include('../server/connection.php');
include '../set.php';
?>
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
<div class="modal fade" id="modal-user" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-sm modal-dialog-centered">
		<div class="modal-content text-center">
			<div class="modal-header">
				<h5 class="modal-title">Change Password</h5>
			</div>
			<form method="post" action="">
			<div class="modal-body">
				<div>
					<input type="hidden" name="position"/>
					<?php echo csrf_field(); ?>
					<div class="input-group">
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1"><i class="fas fa-key"></i></span>
							</div>
							<input class="form-control form-control-sm" 
								pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
								id="password-field" 
								title="Password must contain at least 8 characters, including uppercase, lowercase, number and special character"
								type="password" 
								name="newpass" 
								placeholder="Enter New Password" 
								required
							/>
							<span toggle="#password-field" class="fa fa-sm fa-eye field-icon toggle-password"></span>
						</div>
					</div>
					<div id="password-strength">
						<div class="password-criteria" id="length">• 8+ characters</div>
						<div class="password-criteria" id="uppercase">• 1 uppercase letter</div>
						<div class="password-criteria" id="lowercase">• 1 lowercase letter</div>
						<div class="password-criteria" id="number">• 1 number</div>
						<div class="password-criteria" id="special">• 1 special character</div>
					</div>

					<div class="input-group">
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1"><i class="fas fa-key"></i></span>
							</div>
							<input class="form-control-sm form-control" 
								id="password-field1" 
								type="password" 
								name="confirmpass" 
								placeholder="Confirm Password" 
								required
							/>
							<span toggle="#password-field1" class="fa fa-sm fa-eye field-icon toggle-password"></span>
						</div>
					</div>
					<div class="password-match-message" id="password-match"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-ban"></i> Cancel</button>
					<button type="submit" name='changepass' class="btn btn-success"><i class="fas fa-user-edit"></i> Change</button>					
				</div>
			</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(".toggle-password").click(function() {
		$(this).toggleClass("fa-eye fa-eye-slash");
		var input = $($(this).attr("toggle"));
		if (input.attr("type") == "password") {
			input.attr("type", "text");
		} else {
			input.attr("type", "password");
		}
	});

	// Password strength validation
	$('#password-field').on('input', function() {
		var password = $(this).val();
		$('#password-strength').show();

		// Check each criteria
		$('#length').toggleClass('criteria-met', password.length >= 8);
		$('#uppercase').toggleClass('criteria-met', /[A-Z]/.test(password));
		$('#lowercase').toggleClass('criteria-met', /[a-z]/.test(password));
		$('#number').toggleClass('criteria-met', /\d/.test(password));
		$('#special').toggleClass('criteria-met', /[@$!%*?&]/.test(password));
	});

	// Password match validation
	$('#password-field1').on('input', function() {
		var password = $('#password-field').val();
		var confirmPassword = $(this).val();
		var message = $('#password-match');

		if (confirmPassword === '') {
			message.text('').removeClass('criteria-met criteria-not-met');
		} else if (password === confirmPassword) {
			message.text('Passwords match').addClass('criteria-met').removeClass('criteria-not-met');
		} else {
			message.text('Passwords do not match').addClass('criteria-not-met').removeClass('criteria-met');
		}
	});
</script>