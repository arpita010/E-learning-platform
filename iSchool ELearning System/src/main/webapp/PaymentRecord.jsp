<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,com.dao.*,com.objects.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Records</title>
<%@include file="common_components/common.jsp"%>
<link href='https://fonts.googleapis.com/css?family=Sahitya' rel='stylesheet'>
<style>
body {
    font-family: 'Sahitya';
    background-color:#fec8ed;
    
}
.payment
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
			<form >
				<div class="row mt-2 p-4">
					<div class="col-sm-2 p-2">
						<label for="orderID">Order ID</label>
					</div>
					<div class="col text-center">
						<input type="text" id="orderID" class="form-control"
							name="orderID" placeholder="Order ID">
					</div>
					<div class="col">
						<button type="submit" class="btn btn-success">Search</button>
					</div>
				</div>
			</form>
			<%String orderId=request.getParameter("orderID");%>
			<% 
			if(orderId!=null){
			Order order=OrderDao.checkPaymentStatus(orderId);
			%>
			<div class="container" >
				<!--  row 2 for data -->
				<div class="card m-2">
				<div class="card-header">
				<h5>Payment Information</h5>
				</div>
				<div class="card-body">
				<table class="table table-responsive-sm table-hover table-stripped text-center">
				<tr>
				<th>OrderID</th>
				<td><%=orderId %></td>
				</tr>
				<tr>
				<th>Course ID</th>
				<td><%=order.getCourseId() %></td>
				</tr>
				<tr>
				<th>Course Name</th>
				<td><%=order.getCourseName() %></td>
				</tr><tr>
				<th>Student ID</th>
				<td><%=order.getStudentId() %></td>
				</tr>
				<tr>
				<th>Student Email</th>
				<td><%=order.getStudentEmail() %></td>
				</tr>
				<tr>
				<th>Amount</th>
				<td><%=order.getAmount() %></td>
				</tr>
				</table>
				</div>
				</div>

			</div>
			
			<%} %>
			
		</div>
		<!-- col-10 ends -->
	</div>
	<!-- row ends -->
</body>
</html>