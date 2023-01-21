<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.*,com.objects.Student,com.dao.StudentDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Students</title>
<%@include file="common_components/common.jsp"%>
<link href='https://fonts.googleapis.com/css?family=Simonetta' rel='stylesheet'>
<style>
body {
    font-family: 'Simonetta';
    background-color:#fec8ed;
    
}
.students
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
	<%@include file="messagePopup/warningMessage.jsp" %>
	<div class="row" style="max-width: 100%;">
		<%@include file="common_components/adminSidebar.jsp"%>
		<div class="col-sm-10 mt-4 ">
			<div class="container-fluid">
				<h4 style="display: inline-block;">List of Students</h4>
				<a href="#addNewStudentModal" data-toggle="modal"
					data-target="#addNewStudentModal"
					class="btn btn-outline-danger float-right">Add a new Student</a>
			</div>
			<%List<Student> stdList=StudentDao.getAllStudents(); %>
			<div class="m-2">
				<%
				if(stdList.size()==0){
				%>
				<h4 class="text-center">No record found</h4>
				<%} %>
				<form action="deleteStudent" method="post" name="deleteStudentForm" id="deleteStudentForm" hidden>
				<input type="hidden" name="delStudentId" id="delStudentId" value="">
				</form>
				<table
					class="table table-responsive-sm table-hover table-stripped text-center">
					<tr>
						<th>Student ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Action</th>
					</tr>
					<%for(Student student:stdList){ %>
					<tr>
						<td><%=student.getStudentId() %></td>
						<td><%=student.getStudentName() %></td>
						<td><%=student.getStudentEmail() %></td>
						<td><button class="btn" onclick="deleteStudent('<%=student.getStudentId()%>')">del</button>
							<a href="#editStudentModal" data-toggle="modal" data-target="#editStudentModal" class="btn btn-danger" onclick="editStudent('<%=student.getStudentId()%>')">edit</a></td>
					</tr>
					<%} %>
				</table>

			</div>
		</div>
		<!-- col-10 ends -->
	</div>
	<!-- row ends -->
</body>
<%@include file="modals/addNewStudentModal.jsp"%>
<%@include file="modals/editStudentModal.jsp" %>
</html>