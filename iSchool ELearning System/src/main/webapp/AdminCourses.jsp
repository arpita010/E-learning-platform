<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,com.dao.CourseDao,com.objects.Course" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Courses</title>
<%@include file="common_components/common.jsp"%>
<link href='https://fonts.googleapis.com/css?family=Zen Old Mincho' rel='stylesheet'>
<style>
body {
    font-family: 'Zen Old Mincho';font-size: 18px;
    background-color:#fec8ed;
}
.courses
{
background-color:#c15ba2 !important;
text-align:center;
}
.list-group-item-actions
{
background-color:#e2e2e3;
text-align:center;
color:#612d51;
}
</style>

</head>
<body>
	<%@include file="common_components/navbar.jsp"%>
	<%@include file="messagePopup/primaryMessage.jsp" %>
	<div class="row" style="max-width: 100%;">
		<%@include file="common_components/adminSidebar.jsp"%>
		<div class="col-sm-10 mt-4 ">
			<div class="container-fluid">
				<h4 style="display: inline-block;">List of Courses</h4>
				<a href="#addNewCourseModal" data-toggle="modal"
					data-target="#addNewCourseModal"
					class="btn btn-outline-success float-right">Add new Course</a>
			</div>
			<%
			List<Course> courseList=CourseDao.getAllCourses();
			
			%>
			<div class="m-2">
				<%
					if(courseList.size()==0)
					{
					%>
					<h4 class="text-center">No record found</h4>
					<%	
					}
				%>
				<form action="deleteCourse" method="post" name="deleteCourseForm" id="deleteCourseForm" hidden>
				<input type="hidden" name="delCourseId" id="delCourseId" value="">				
				</form>
				<table
					class="table table-responsive-sm table-hover table-stripped text-center">
					
					<tr>
						<th>Course ID</th>
						<th>Name</th>
						<th>Author</th>
						<th>Action</th>
					</tr>
					<% 
					for(Course course:courseList)
					{
					%>
					<tr>
						<td><%=course.getCourseID() %></td>
						<td><%=course.getCourseName() %></td>
						<td><%=course.getAuthor() %></td>
						<td><button class="btn" onclick="deleteCourse('<%=course.getCourseID()%>')">del</button>
							<a href="#editCourseModal" data-toggle="modal" data-target="#editCourseModal" class="btn btn-danger" onclick="editCourse('<%=course.getCourseID()%>')">Edit</a></td>
					</tr>
					<%} %>
					
				</table>

			</div>
		</div>
		<!-- col-10 ends -->
	</div>
	<!-- row ends -->
</body>
<%@include file="modals/addNewCourseModal.jsp"%>

<%@include file="modals/editCourseModal.jsp" %>
</html>