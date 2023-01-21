<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,com.dao.*,com.objects.*" %>
<%
Student fUser=(Student)session.getAttribute("user");
if(fUser==null)
{
	response.sendRedirect("index.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Feedback Page</title>
<%@include file="common_components/common.jsp"%>
<link href='https://fonts.googleapis.com/css?family=Reggae One' rel='stylesheet'>
<style>
body {
    font-family: 'Reggae One';font-size: 15px;
    background-color:#e4dbfe;
}
.feedback
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
			<div class="card p-3" style="background-color:#e2e3e4;">
				<div class="card-body">
					<form action="sendFeedback" method="post">
						<div class="form-group">
							<label for="studentID">Student ID</label> <input type="text"
								readonly value="<%=fUser.getStudentId() %>" name="studentID" class="form-control">
						</div>
						<div class="form-group">
							<label for="feedback">Write Feedback</label>
							<textarea name="feedback" class="form-control" id="feedback" placeholder="Write your feedback here.."></textarea>
						</div>
						<div class="form-group text-center">
							<button type="submit" class="btn btn-outline-secondary">Send
								Feedback</button>

						</div>
					</form>


				</div>
				<!-- card body ends -->

			</div>
			<!-- card ends -->
		</div>
		<!-- col ends -->
	</div>
	<!-- row ends -->
</body>
</html>