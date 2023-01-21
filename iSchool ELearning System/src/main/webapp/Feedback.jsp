<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,com.objects.*,com.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Feedbacks</title>
<%@include file="common_components/common.jsp" %>
<link href='https://fonts.googleapis.com/css?family=Forum' rel='stylesheet'>
<style>
body {
    font-family: 'Forum';font-size: 18px;
    background:url('images/book.jpg');
    background-position:fixed;
    background-repeat:no-repeat;
}
.card_s
{
background-color:#e2efe5;

}
.card_s:hover
{
background-color:#e2e2e2;
}
</style>
</head>
<body>
<%@include file="common_components/navbar.jsp" %>
<div class="row mt-3 mx-2">
<div class="col">
<div class="row">
<div class="card-columns ml-2 mr-3">
<%List<Feedback> feedList=FeedbackDao.getAllFeedbacks();
for(Feedback f:feedList){%>
<div class="card card_s">
<div class="card-header text-center">
<%String feedImageName=f.getStudentID()+".png" ;%>
<img class="rounded-circle" src="UserProfilePictures/<%=feedImageName.trim() %>" style="width:15vw;height:15vh;">

</div>
<div class="card-body">
<p class="text-center"><%= f.getFeedback()%></p>
<p class="text-right"><b>~<%=StudentDao.getNameById(f.getStudentID()) %></b></p>
</div>
<div class="card-footer"></div>
</div>
<%} %>
</div>

</div>

</div>

</div>


</body>
</html>