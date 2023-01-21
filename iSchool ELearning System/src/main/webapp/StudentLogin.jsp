<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,com.objects.*,com.dao.*" %>
<%
if(session.getAttribute("user")==null||(!(session.getAttribute("user") instanceof Student)))
{
	//message
	session.setAttribute("message", "You can't access this page !");
	response.sendRedirect("index.jsp");
	return;
}
%>
<%Student activeStudent=(Student)session.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Dashboard</title>
<%@include file="common_components/common.jsp"%>
<link href='https://fonts.googleapis.com/css?family=Rokkitt' rel='stylesheet'>
<style>
body {
    font-family: 'Rokkitt';font-size: 20px;
    background:#e4dbfe;
}
.profile
{
background-color:#d7c8fd !important;
text-align:center;
}
.list-group-item-actions
{
background-color:#e2e2e3;
text-align:center;
color:#4e3694;
}
</style>
</head>
<body>
	<%@include file="common_components/navbar.jsp"%>
	<%@include file="messagePopup/successMessage.jsp" %>
	<div class="row row-maxwidth" style="max-width: 100%;">
		<%@include file="common_components/sidebar.jsp"%>
		<div class="col-sm-8 mt-50">
			<div class="card p-3" style="background-color:#e3e3e3;">
				<!-- my profile details -->
				<div class="card-body">
					<form action="updateProfile" method="post">
						<div class="form-group">
							<label for="studentID">Student ID</label> <input type="text"
								name="studentID" id="studentID" readonly value="<%=activeStudent.getStudentId()%>"
								class="form-control">
								<small class="text-center" style="color:red;">**You can't change this field.</small>
					
						</div>
						<div class="form-group">
							<label for="email">Email</label> <input type="text" name="email"
								id="email"  class="form-control" value="<%=activeStudent.getStudentEmail() %>" readonly>
							<small class="text-center" style="color:red;">**You can't change this field.</small>
						</div>

						<div class="form-group">
							<label for="studentName">Student Name</label> <input type="text"
								name="studentName" id="studentName"
								placeholder="Student Full Name" class="form-control">
						</div>

						<div class="form-group">
							<label for="contactNumber">Contact Number</label> <input
								type="text" name="contactNumber" id="contactNumber"
								placeholder="Contact Number" class="form-control">
						</div>
						
						<div class="form-group text-center">
							<button type="submit" class="btn btn-outline-success">Update</button>
						</div>

					</form>


				</div>
				<!-- card body ends -->
			</div>
			<!-- card ends -->
		</div>
		<!-- col-8 ends -->
	</div>
	<!-- row ends -->
</body>
</html>