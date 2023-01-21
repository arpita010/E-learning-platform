<div class="modal fade" id="addNewStudentModal">
	<div class="modal-dialog">
		<div class="modal-content modal_color_green">
			<div class="modal-header">
				<h5 class="px-4">New Student Registration</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="addStudent" method="post">
					<div class="form-group">
						<label for="username">Username</label> <input type="text"
							id="username" class="form-control" name="username"
							placeholder="Student Name">
					</div>
					<div class="form-group">
						<label for="email">Email Address</label> <input type="text"
							class="form-control" id="email" name="email"
							placeholder="Email Address">
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							id="password" class="form-control" name="password"
							placeholder="Password">
					</div>
					<div class="form-group text-center">
						<button type="submit" class="btn btn-outline-danger">Add</button>
						<button type="button" class="btn btn-outline-success"
							data-dismiss="modal">Cancel</button>
					</div>
				</form>

			</div>

		</div>

	</div>

</div>


