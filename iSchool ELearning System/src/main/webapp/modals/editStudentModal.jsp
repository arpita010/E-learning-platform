<div class="modal fade" id="editStudentModal">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content">
<div class="modal-header">
<h5>Edit Student Details</h5>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
<form action="editStudent" method="post">
<input type="hidden" name="editStudentId" id="editStudentId" value="">
<div class="form-group">
<label for="email">Email Address*</label>
<input type="text" class="form-control" name="email" id="email" placeholder="New Email Address">
</div>
<div class="form-group">
<label for="name">Student Name</label>
<input type="text" name="name" id="name" placeholder="New Username" class="form-control">
</div>
<div class="form-group text-center">
<button type="submit" class="btn btn-danger">Save Changes</button>
<button type="button" class="btn btn-warning">Cancel</button>
</div>
</form>


</div>


</div>
</div>

</div>