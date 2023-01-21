<div class="modal fade" id="loginModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content modal_color_light">
			<div class="modal-header">
				<h5 class="modal-title">Student Login</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="StudentLogin" method="post" onsubmit="return validForm()">
					<div class="form-group">
						<label for="email">Email</label> <input type="text" name="email"
							id="email" placeholder="Email Address" class="form-control ">
						<span id="emailWarning"></span>
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							name="password" id="password" placeholder="Password"
							class="form-control">
						<span id="passwordWarning"></span>
					</div>
					<div class="container text-center">
						<button type="submit" class="btn btn-secondary">Sign In</button>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>