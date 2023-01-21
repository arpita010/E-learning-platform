<div class="col-sm-2">
	<div class="list-group  m-3">
		<a href="AdminLogin.jsp"
			class="list-group-item list-group-item-actions dashboard">Dashboard</a> <a
			href="AdminCourses.jsp"
			class="list-group-item list-group-item-actions courses">Courses</a> <a
			href="AdminLessons.jsp"
			class="list-group-item list-group-item-actions lessons">Lessons</a> <a
			href="AdminStudents.jsp"
			class="list-group-item list-group-item-actions students">Students</a> 
			 <a href="PaymentRecord.jsp"
			class="list-group-item list-group-item-actions payment">Payment Records</a> <a
			href="AllFeedbacks.jsp"
			class="list-group-item list-group-item-actions feedback">All Feedbacks</a> <a
			href="#changeAdminPasswordModal" data-toggle="modal"
			data-target="#changeAdminPasswordModal"
			class="list-group-item list-group-item-actions change">Change Password</a> <a
			href="Logout.jsp" class="list-group-item list-group-item-actions logout">Logout</a>
	</div>
</div>
<%@include file="../modals/changeAdminPasswordModal.jsp"%>