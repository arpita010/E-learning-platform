<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.objects.*,com.dao.*"%>
<%
if(session.getAttribute("user")==null||(!(session.getAttribute("user") instanceof AdminUser)))
{
	//message
	response.sendRedirect("index.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>

<%@include file="common_components/common.jsp"%>
<link href='https://fonts.googleapis.com/css?family=Milonga' rel='stylesheet'>
<style>
body {
    font-family: 'Milonga';
    background-color:#fec8ed;
}
.dashboard
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
.card_s
{
background-color:#e6b9d8;
}
.card_s:hover
{
background-color:white;
}
</style>

</head>
<body>
	<%@include file="common_components/navbar.jsp"%>
	<%@include file="messagePopup/primaryMessage.jsp" %>
	<div class="row" style="max-width: 100%;">
		
		<%@include file="common_components/adminSidebar.jsp"%>
		<div class="col-sm-10 mt-4 ">
			<div class="row mt-2 p-4" >

				<div class="col">
					<div class="card card_s">
						<div class="card-header">Courses</div>
						<div class="card-body text-center"><%=CourseDao.getCourseCount() %></div>
						<div class="card-footer text-center">
						<a href="AdminCourses.jsp">View</a></div>
					</div>
				</div>

				<div class="col">
					<div class="card card_s">
						<div class="card-header">Students</div>
						<div class="card-body text-center"><%=StudentDao.getStudentCount() %></div>
						<div class="card-footer text-center">
						<a href="AdminStudents.jsp" >View</a>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card card_s">
						<div class="card-header">Purchased Courses</div>
						<div class="card-body text-center"><%=OrderDao.countOrders() %></div>
						<div class="card-footer text-center">
						<a href="AdminLogin.jsp">View</a>
						</div>
					</div>
				</div>




			</div>
			<!-- row1 -->

			<div class="row mt-2 p-4"
				style=" max-height: 55%; overflow: auto;">
				<!-- form for deleting orders.. -->
				<form action="deleteOrder" method="post" hidden name="deleteOrderForm" id="deleteOrderForm">
				<input type="hidden" name="delOrderId" value="" id="delOrderId">
				</form>
				<!-- form ends -->
				<h6>Course Ordered</h6>
				<table
					class="table table-stripped table-responsive-sm table-hover text-center m-2">
					<tr>
						<th>Order ID</th>
						<th>Course ID</th>
						<th>Student Email</th>
						<th>Order Date</th>
						<th>Amount</th>
						<th>Action</th>
					</tr>
					<%List<Order> oList=OrderDao.getAllPurchasedCourses();
					for(Order o:oList){%>
					<tr>
						<td><%=o.getOrderId() %></td>
						<td><%=o.getCourseId() %></td>
						<td><%=o.getStudentEmail() %></td>
						<td>90392</td>
						<td><%=o.getAmount() %></td>
						<td><button type="button" class="btn" onclick="deleteOrder('<%=o.getOrderId()%>')">Delete</button></td>
					</tr>
					<%} %>
					
				</table>

			</div>
			<!-- row 2 ends -->

		</div>
		<!-- col-10 ends -->

	</div>
	<!-- row ends -->
</body>
</html>