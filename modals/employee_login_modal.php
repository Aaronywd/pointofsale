<div class="modal fade" id="modal-user" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-sm modal-dialog-centered">
		<div class="modal-content text-center">
			<div class="modal-header">
				<h5 class="modal-title"><i class="fas fa-user-lock"></i> Sign In</h5>
			</div>
			<form method="post" action="login.php">
			<div class="modal-body">
				<div>
					<?php echo csrf_field(); ?>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
						</div>
						<input class="form-control-sm form-control" type="text" name="username" placeholder="Enter Username" required/>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1"><i class="fas fa-key"></i></span>
						</div>
						<input class="form-control-sm form-control" type="password" name="password" id="employeePassword" placeholder="Enter Password" required/>
						<div class="input-group-append">
							<button class="btn btn-outline-secondary btn-sm" type="button" onclick="togglePassword('employeePassword')">
								<i class="fas fa-eye" id="employeePasswordIcon"></i>
							</button>
						</div>
					</div>
					<input type="hidden" name="position" value="Employee"/>
					<div class="text-right">
						<a href="#" data-toggle="modal" data-target="#employeeForgotPasswordModal" data-dismiss="modal">Forgot Password?</a>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-ban"></i> Close</button>
					<button type="submit" name='login' class="btn btn-success"><i class="fas fa-sign-in-alt"></i> Login</button>					
				</div>
			</form>
			</div>
		</div>
	</div>
</div>

<!-- Employee Forgot Password Modal -->
<div class="modal fade" id="employeeForgotPasswordModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><i class="fas fa-key"></i> Forgot Password - Employee</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="forgot_password.php">
                <div class="modal-body">
                    <?php echo csrf_field(); ?>
                    <input type="hidden" name="position" value="Employee"/>
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" name="email" class="form-control" required
                               placeholder="Enter your registered email address">
                        <small class="form-text text-muted">
                            We'll send password reset instructions to this email address.
                        </small>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" name="forgot_password" class="btn btn-primary">
                        <i class="fas fa-paper-plane"></i> Send Reset Link
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
