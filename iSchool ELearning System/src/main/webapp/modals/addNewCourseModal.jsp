<div class="modal fade" id="addNewCourseModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content modal_color_yellow">
			<div class="modal-header">
				<h5 class="px-2" style="display: inline-block;">Add New Course</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="addCourse" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<input type="text" id="courseName" name="courseName"
							class="form-control" placeholder="Course Name">
					</div>
					<div class="form-group">
						<input type="text" id="courseDesc" name="courseDesc"
							class="form-control" placeholder="Course Description">
					</div>
					<div class="form-group">
						<input type="text" id="author" name="author" class="form-control"
							placeholder="Author Name">
					</div>
					<div class="form-group">
						<input type="text" id="duration" name="duration"
							class="form-control" placeholder="Course Duration">
					</div>
					<div class="form-group">
						<input type="text" id="originalPrice" name="originalPrice"
							class="form-control" placeholder="Original Price">
					</div>
					<div class="form-group">
						<input type="text" id="sellingPrice" name="sellingPrice"
							class="form-control" placeholder="Selling Price">
					</div>

					<div class="form-group">
						<label for="courseImage">Upload Image</label> <input type="file"
							id="courseImage" name="courseImage" class="form-control">
					</div>
					<div class="form-group text-center">
						<button type="submit" class="btn btn-outline-success">Submit</button>
					</div>
				</form>



			</div>
		</div>
	</div>
</div>