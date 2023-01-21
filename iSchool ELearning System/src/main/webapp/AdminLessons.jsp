<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,com.objects.*,com.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lessons</title>
<%@include file="common_components/common.jsp"%>

<link href='https://fonts.googleapis.com/css?family=Vast Shadow' rel='stylesheet'>
<style>
body {
    font-family: 'Vast Shadow';
background-color:#fec8ed;
}
.lessons
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
	<%@include file="messagePopup/successMessage.jsp" %>
	<div class="row" style="max-width: 100%;">
		<%@include file="common_components/adminSidebar.jsp"%>
		<div class="col-sm-10 mt-4 ">
			<form>
				<div class="row">
					<div class="col-sm-2">
						<label for="courseID" class="p-2">Enter Course ID</label>
					</div>
					<div class="col-sm-4">
						<input type="text" class="form-control text-center"
							placeholder="Course ID" name="courseId">
					</div>
					<div class="col-sm-2">
						<button type="submit" class="btn btn-primary">Search</button>
					</div>
				</div>
			</form>
			<div class="container-fluid text-right">
				<a href="#addNewLessonModal" data-toggle="modal"
					data-target="#addNewLessonModal" class="btn btn-danger">Add
					new Lesson</a>
			</div>
			<%
			String cid=request.getParameter("courseId");
			if(cid!=null){
			Course course=CourseDao.getCourseById(cid);
			List<Chapter> chList=ChapterDao.allChapters(cid);
			%>
			
			<div class="container-fluid m-4" >
			<div class="card">
			<div class="card-header">
			<h5 class="float-left">Course Id : <%=cid %></h5>
			<h5 class="float-right">Course Name : <%=course.getCourseName()%></h5>
			</div>
			<div class="card-body">
			<form action="deleteChapter" method="post" hidden name="deleteLessonForm" id="deleteLessonForm">
			<input type="hidden" name="delLessonId" id="delLessonId" value="">
			</form>
			<table class="table table-responsive-sm table-hover table-stripped text-center">
			<tr>
			<th>Chapter Id</th>
			<th>Chapter Name</th>
			<th>Chapter Description</th>
			<th>Video Link</th>
			<th>Action</th>
			</tr>
			<%for(Chapter ch:chList){ %>
			<tr>
			<td><%=ch.getChapterId() %></td>
			<td><%=ch.getChapterName() %></td>
			<td><%=ch.getChapterDesc() %></td>
			<td><%=ch.getVideoLink() %></td>
			<td><button type="button" class="btn" onclick="deleteLesson('<%=ch.getChapterId()%>')">delete</button></td>
			</tr>
			
			<%} %>
			</table>
			
			
			</div>
			
			
			
			</div><!-- card ends -->
			
			</div><!-- container ends -->
			<%} %>
		</div>
		<!-- col-10 ends -->
	</div>
	<!-- row ends -->
</body>
<%@include file="modals/addNewLessonModal.jsp"%>
</html>