<%@page import="java.util.*,com.objects.*,com.dao.*" %>

<nav class="navbar navbar-expand-lg navbar-light"
	style="background:rgba(0,0,0,0.5);">
	<button type="button" class="navbar-toggler" data-toggle="collapse"
		data-target="#nav-items">
		<span class="navbar-toggler-icon"></span>
	</button>
	<a href="index.jsp" class="navbar-brand c-white px-4"><i><b>Toppers Hub - Edu Spot</b></i>
	</a>

	<!--  -->
	<div class="collapse navbar-collapse" id="nav-items">

		<ul class="navbar-nav ml-auto px-4">

			<li class="nav-item active px-3"><a href="index.jsp"
				class="nav-link c-white">Home</a></li>
			<li class="nav-item active px-3"><a href="courses.jsp"
				class="nav-link c-white">Courses</a></li>
			<%if(session.getAttribute("user")==null){%>
			<li class="nav-item active px-3">
			
			<a href="#loginModal"
				data-toggle="modal" data-target="#loginModal"
				class="nav-link c-white">Login</a>
			</li>
			<li class="nav-item active px-3"><a href="#signupModal"
				data-toggle="modal" data-target="#signupModal"
				class="nav-link c-white">Sign Up</a></li>
			<%} %>
			<li class="nav-item active px-3"><a href="Feedback.jsp"
				class="nav-link c-white">Feedbacks</a></li>
			<li class="nav-item active px-3"><a href="contactUs.jsp"
				class="nav-link c-white">Contact</a></li>
			<%if(session.getAttribute("user") instanceof Student) {%>
			<li class="nav-item active px-3"><a href="StudentLogin.jsp"
				class="nav-link c-white">Student Dashboard</a></li>
			<%} %>
			<%if(session.getAttribute("user") instanceof AdminUser) {%>
			<li class="nav-item active px-3"><a href="AdminLogin.jsp"
				class="nav-link c-white">Admin Dashboard</a></li>
			<%} %>
			
		</ul>
	</div>
</nav>
<%@include file="../modals/LoginModal.jsp"%>
<%@include file="../modals/SignupModal.jsp"%>