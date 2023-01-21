<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,com.objects.Feedback,com.dao.FeedbackDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Received Feedbacks</title>

<%@include file="common_components/common.jsp"%>
<link href='https://fonts.googleapis.com/css?family=Send Flowers' rel='stylesheet'>
<style>
body {
    font-family: 'Send Flowers';font-size: 18px;
    
    background-color:#fec8ed;
}
.feedback
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
			<h4 class="p-2" style="background: black; color: white;">List of
				feedbacks</h4>
			<div class="m-3">
			<form action="deleteFeedback" method="post" name="deleteFeedbackForm" id="deleteFeedbackForm" hidden>
			<input type="hidden" name="delFeedbackId" id="delFeedbackId" value="">
			</form>
				<table class="table table-hover table-stripped text-center">
					<tr>
						<th>Feedback ID</th>
						<th>Content</th>
						<th>Student ID</th>
						<th>Action</th>
					</tr>
			<%List<Feedback> fList=FeedbackDao.getAllFeedbacks(); 
			for(Feedback f:fList){%>
					<tr>
					<td><%=f.getFeedbackID() %></td>
					<td><%=f.getFeedback() %></td>
					<td><%=f.getStudentID() %></td>
					<td><button class="btn" onclick="deleteFeedback('<%=f.getFeedbackID()%>')">Delete</button></td>
					</tr>
					<%} %>
				</table>

			</div>
		</div>
		<!-- col-10 ends -->
	</div>
	<!-- row ends -->
</body>
</html>