<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,com.objects.*,com.dao.*" %>
<%
Student st=(Student)session.getAttribute("user");
if(st==null)
{
	response.sendRedirect("index.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Courses</title>
<%@include file="common_components/common.jsp"%>
<link href='https://fonts.googleapis.com/css?family=Quando' rel='stylesheet'>
<style>
body {
    font-family: 'Quando';
    background-color:#e4dbfe;
}
.mycourses
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
.coursecard
{
background-color:#f3e5ee;
}
</style>
</head>
<body>
	<%@include file="common_components/navbar.jsp"%>
	<%@include file="messagePopup/warningMessage.jsp" %>
	<div class="row row-maxwidth" style="max-width: 100%;">
		<%@include file="common_components/sidebar.jsp"%>
		<div class="col-sm-8 mt-50">
			<h4 class="text-center p-2" style="background:black;color:white;">All Enrolled courses</h4>
			<%List<Course> enList=CourseDao.getEnrolledCourses(st.getStudentId());
			for(Course c:enList){
			%>
			<div class="card mt-2 coursecard">
				<div class="card-header">
				<h5 class=""><%=c.getCourseName() %></h5>
				</div>
				<div class="card-body ">
				<div class="row" style="max-width:100%;">
				<div class="col-sm-3 m-2 text-center mt-auto mb-auto">
				<%String imgName=c.getCourseID()+".png"; %>
				<img src="courseImages/<%=imgName.trim() %>" alt="image not found" style="width:15vw;height:15vh;">
				</div>
				<div class="col text-left">
				<p><%=c.getCourseDescription() %></p>
				<p>Duration : <%=c.getDuration() %></p>
				<p>Instructor : <%=c.getAuthor() %></p>
				<p>Price : <del><%=c.getOriginalPrice() %></del> <span><%=c.getSellingPrice() %></span></p>
				<p>
				</div>
				</div><!-- card row ends -->
				</div><!-- card body ends -->
				<div class="card-footer text-right">
				<a href="viewCourseDetails.jsp?courseId=<%=c.getCourseID() %>" class="btn btn-primary">View Course</a>
				</div>
			</div>
			<%} %>
		</div>
	</div>
</body>
</html>
