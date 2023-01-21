<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,com.objects.*,com.dao.*" %>
<% String courseId=request.getParameter("courseId");
if(courseId==null)
{
	response.sendRedirect("StudentMyCourses.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Course Details</title>
<%@include file="common_components/common.jsp" %>
<link href='https://fonts.googleapis.com/css?family=Kavoon' rel='stylesheet'>

<style>
body {
    font-family: 'Kavoon';font-size: 15px;
    background-color:#e4fced;
}

</style>
<script src="js/script.js"></script>
</head>
<body>
<%@include file="common_components/navbar.jsp" %>
<%List<Chapter> chapList=ChapterDao.getchaptersByCourseId(courseId);  %>
<div class="row m-2" style="max-width:100%;">
<div class="col-sm-3">
<div class="list-group text-center">
<%for(Chapter c:chapList){ 
String videoLinkUrl=c.getVideoLink();
%>
<a href="chapterVideos/<%=videoLinkUrl.trim() %>" target="if1" class="list-group-item list-group-item-actions" style="background-color:#453628;color:white;" onclick="return myfun()" ><%=c.getChapterName() %></a>
<%} %>
</div>
</div><!-- col1 ends -->
<div class="col-sm-8 m-4">
<iframe src="images/video.mp4" name="if1" id="if1" style="width:100%;height:600px;" hidden></iframe>
</div>
</div><!-- main row ends -->
</body>
</html>