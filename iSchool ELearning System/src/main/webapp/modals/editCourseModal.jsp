<div class="modal fade" id="editCourseModal">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content">
<div class="modal-header">
<h5>Edit Course Details</h5>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
<form method="post" action="editCourse" name="editCourseForm" id="editCourseForm">
<input type="hidden" name="editCourseId" id="editCourseId" value="">
<div class="form-group">
<label for="newName">New Course Name</label>
<input type="text" name="newName" id="newName" placeholder="New Course Name" class="form-control">
</div>
<div class="form-group">
<label for="">New Author Name</label>
<input type="text" name="newAuthor" id="newAuthor" placeholder="New Author Name" class="form-control">
</div>
<div class="form-group text-center">
<button type="submit" class="btn btn-danger">Save Changes</button>
<button type="button" data-dismiss="modal" class=" btn btn-primary">Cancel</button>
</div>
</form>

</div>


</div>
</div>
</div>