<div class="modal fade" id="changePasswordModal">
	<div class="modal-dialog ">
		<div class="modal-content modal_color_yellow">
			<div class="modal-header">
				<h5>Change Password</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="changeStudentPassword" method="post">
					<div class="form-group">
						<label for="currentPassword">Current Password</label> <input
							type="password" id="currentPassword" class="form-control"
							name="currentPassword" placeholder="Current Password">
					</div>
					<div class="form-group">
						<label for="newPassword">New Password</label> <input
							type="password" id="newPassword" class="form-control"
							name="newPassword" placeholder="New Password">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-outline-danger">Change
							Password</button>
					</div>
				</form>

			</div>
		</div>

	</div>


</div>