<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.objects.*" %>
<%@include file="common_components/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
<link href='https://fonts.googleapis.com/css?family=Kavoon' rel='stylesheet'>
<style>
body {
    font-family: 'Kavoon';font-size: 15px;
}
</style>

</head>
<!-- #C33764
#1D2671
 -->
<body
	style="background: linear-gradient(to bottom, #C33764 0%, #1D2671 100%);">
	<%@include file="common_components/navbar.jsp"%>
	<div class="container " style="margin-top: 3%;">
		<h1 class="text-white text-center">Contact Us</h1>
		<div class="text-center text-white p-3">
			<p>
				Got a question? We'd love to hear from you. Send us a message <br>and
				we'll response as soon as possible.
			</p>
		</div>
		<form action="contact" method="post">
			<div class="form-group p-2">
				<label for="name" style="color: white;">Name*</label> <input
					type="text" name="name" class="form-control"
					placeholder="Enter your name" id="name">
			</div>
			<div class="form-group p-2">
				<label for="email" style="color: white;">Email*</label> <input
					type="email" name="email" class="form-control"
					placeholder="Enter your email" id="email">
			</div>
			<div class="form-group p-2">
				<label for="comment" style="color: white;">Message*</label>
				<textarea class="form-control text-center" name="comment"
					id="comment" placeholder="Drop Your Message here..."></textarea>
			</div>
			<div class="form-group text-center">
				<button type="submit" class="btn btn-outline-success">Send
					Message</button>
			</div>
		</form>
	</div>
</body>
</html>