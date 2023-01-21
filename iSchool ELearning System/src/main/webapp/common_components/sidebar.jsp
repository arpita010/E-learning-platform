<%@page import="java.util.*,com.dao.*,com.objects.*" %>
<%
Student sideStudent=(Student)session.getAttribute("user");
if(sideStudent==null)
{
	response.sendRedirect("index.jsp");
	return;
}
%>
<div class="col-sm-2">
	<div class="container text-center">
	<%String sideUserImage=sideStudent.getStudentId()+".png"; %>
		<img src="UserProfilePictures/<%=sideUserImage.trim() %>" class="rounded-circle sidebar-icon-image" style="width:100px;height:100px;margin:5px;">
	</div>
	<div class="list-group px-3">
		<a href="StudentLogin.jsp"
			class="list-group-item list-group-item-actions profile">Profile</a> <a
			href="StudentMyCourses.jsp"
			class="list-group-item list-group-item-actions mycourses">My Courses</a> <a
			href="StudentFeedback.jsp"
			class="list-group-item list-group-item-actions feedback">Send Feedback</a> 
			<a href="#changeProfilePictureModal" data-toggle="modal" data-target="#changeProfilePictureModal" class="list-group-item list-group-item-actions">Change/Upload Profile Picture</a>
			<a
			href="#changePasswordModal" data-toggle="modal"
			data-target="#changePasswordModal"
			class="list-group-item list-group-item-actions change">Change Password</a> <a
			href="Logout.jsp" class="list-group-item list-group-item-actions logout">Logout</a>

	</div>

</div>
<%@include file="../modals/changePasswordModal.jsp"%>
<%@include file="../modals/changeProfilePicture.jsp"%>