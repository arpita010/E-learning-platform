<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Toppers Hub E-learning Platform</title>
<%@include file="common_components/common.jsp"%>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
    font-family: 'Sofia';font-size: 22px;
}

#myVideo {
	position: fixed;
	right: 0;
	bottom: 0;
	min-width: 100%;
	min-height: 100%;
}

#myBtn {
	width: 200px;
	font-size: 18px;
	padding: 10px;
	border: none;
	background: #000;
	color: #fff;
	cursor: pointer;
}

.content {
	position: fixed;
	bottom: 0;
	background: rgba(0, 0, 0, 0.5);
	color: #f1f1f1;
	width: 100%;
	padding: 5px;
}
.messageLocation
{
position:fixed;
margin-top:10vh;
width:40%;
margin-left:30%;
padding:2px;
}
#myBtn:hover {
	background: #ddd;
	color: black;
}
</style>
<link href='https://fonts.googleapis.com/css?family=Sofia|Andika' rel='stylesheet'>
<link href="css/modalColor.css" rel="stylesheet">
</head>
<body>
	<video autoplay muted loop id="myVideo">
		<source src="images/video.mp4" type="video/mp4">
	</video>
	<%@include file="common_components/navbar.jsp"%>
	<div class="messageLocation text-center">
	<%@include file="messagePopup/warningMessage.jsp" %>
	</div>
	<div class="content pt-3">
		<h6 class="text-center" style="font-family: 'Andika';font-size: 18px;">
			copyright@2022, designed by Arpita Mittal || <a href="#adminLoginModal"
				data-toggle="modal" data-target="#adminLoginModal"
				style="color: red;">Admin Login</a>
		</h6>
	</div>
</body>
<%@include file="modals/adminLoginModal.jsp"%>
</html>