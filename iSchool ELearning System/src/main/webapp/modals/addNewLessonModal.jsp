<div class="modal fade" id="addNewLessonModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content modal_color_orange">
			<div class="modal-header">
				<h5 class="text-center">Add a New Chapter</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="addChapter" method="post" enctype="multipart/form-data">
					<div class="form-row">
						<!-- row 1  -->
						<div class="col-sm-4">
							<label for="courseID" class="p-2">Course ID</label>
						</div>
						<div class="col">
							<input type="text" class="form-control" id="courseID"
								name="courseID" placeholder="Course ID">
						</div>
					</div>
					<!-- row1 ends -->
					<div class="form-row">
						<!-- row 2 -->
						<div class="col-sm-4">
							<label for="courseName" class="p-2">Course Name</label>
						</div>
						<div class="col">
							<input type="text" class="form-control" id="courseName"
								name="courseName" placeholder="Course Name">
						</div>
					</div>
					<!-- row2 ends -->
					<div class="form-row">
						<!-- row 3 -->
						<div class="col-sm-4">
							<label for="chapterName" class="p-2">Chapter Name</label>
						</div>
						<div class="col">
							<input type="text" class="form-control" id="chapterName"
								name="chapterName" placeholder="Chapter Name">
						</div>
					</div>
					<!-- row3 ends -->
					<div class="form-row">
						<!-- row 4 -->
						<div class="col-sm-4">
							<label for="chapterDesc" class="p-2">Chapter Description</label>
						</div>
						<div class="col">
							<input type="text" class="form-control" id="chapterDesc"
								name="chapterDesc" placeholder="Chapter Description">
						</div>
					</div>
					<!-- row4 ends -->
					<div class="form-row">
						<!-- row 5 -->
						<div class="col-sm-4">
							<label for="chapterVideo" class="p-2">Chapter video</label>
						</div>
						<div class="col">
						<input type="file" name="video" id="chapterVideo" class="form-control">	
						</div>
					</div>
					<!-- row1 ends -->
					<div class="form-group text-center pt-2">
						<button type="submit" class="btn btn-outline-danger">Submit</button>

						<button type="reset" class="btn btn-outline-primary"
							data-dismiss="modal">Cancel</button>
					</div>

				</form>

			</div>

		</div>
	</div>
</div>