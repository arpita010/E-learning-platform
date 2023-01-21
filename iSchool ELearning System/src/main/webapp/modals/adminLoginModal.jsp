<div class="modal fade" id="adminLoginModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content modal_color_light">
			<div class="modal-header">
				<h5 class="text-center">Admin Login</h5>
				<button type="button" data-dismiss="modal" class="close">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="adminLogin" method="post">
					<div class="form-group">
						<label for="email">Email</label> <input type="text" name="email"
							id="email" class="form-control" placeholder="Email Address">
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							id="password" name="password" class="form-control"
							placeholder="Password">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-outline-success">Login</button>
					</div>

				</form>

			</div>
		</div>
	</div>
</div>