<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*,com.objects.*,com.dao.*" %>
<%
Student checkoutUser=(Student)session.getAttribute("user");
if(checkoutUser==null)
{
	session.setAttribute("message","You can't perform this action.Please login first!!");
	response.sendRedirect("index.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Course</title>
<%@include file="common_components/common.jsp" %>
</head>
<body>
<%@include file="common_components/navbar.jsp" %>
<div class="container">
<div class="card mt-4">
<div class="card-header">
<h5>
Welcome to E-Learning Payment Page</h5>
</div>
<div class="card-body">
<form action="checkout" method="post">
<div class="form-row"><!-- row 1 -->
<div class="col-sm-4 text-center p-2">
<label for="email">Student Email</label>
</div>
<div class="col-sm-6">
<input type="text" name="email" id="email" value="<%=checkoutUser.getStudentEmail() %>" readonly class="form-control">
</div>
</div><!-- row 1 ends  -->
<div class="form-row"><!-- row2 -->
<div class="col-sm-4 text-center p-2">
<label for="courseName">Course Name</label>
</div>
<div class="col-sm-6">
<%Course checkCourse=CourseDao.getCourseById(request.getParameter("courseId")); %>
<input type="text" value="<%=checkCourse.getCourseName() %>" name="courseName" id="courseName" readonly class="form-control">
</div>
</div><!-- row 2 ends -->
<div class="form-row"><!-- row 3 -->
<div class="col-sm-4 text-center p-2">
<label for="amount">Amount</label>
</div>
<div class="col-sm-6">
<input type="text" name="amount" id="amount" readonly class="form-control" value="<%=checkCourse.getSellingPrice()%>">
</div>
</div><!--row 3 ends-->
<div class="form-row ">
<div class="col text-center">
<!-- hidden course id field -->
<input type="text" name="courseId" value="<%=request.getParameter("courseId")%>" hidden>
<button type="submit" class="btn btn-primary">Check Out</button>
</div>
</div>
</form>

</div>
</div>
</div>
</body>
</html>