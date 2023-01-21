
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,com.objects.*,com.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Available Courses</title>
<%@include file="common_components/common.jsp" %>
<link href='https://fonts.googleapis.com/css?family=Charm' rel='stylesheet'>

<style>
body{
font-family:'Charm';
font-size:18px;
background:#e4dbfe;
}
.list-group-item
{
background-color:#d7c8fd;
text-align:center;
}
.list-group-item-actions
{
background-color:#e2e2e3;
text-align:center;
color:#4e3694;
}
.card {
	background-color: #ecedee;
}

.card:hover {
	background-color:#e4dbfe;
}
</style>
</head>
<body>
	<%@include file="common_components/navbar.jsp" %>
	<%@include file="messagePopup/warningMessage.jsp" %>
	<div class="row mt-3 mx-2">
		<div class="col-sm-2">
			<div class="list-group" style="overflow-y: auto; max-height: 100vh;">
				<%if(request.getParameter("id")==null||request.getParameter("id").equals("all")){ %>
				<a href="courses.jsp?id=all"
					class="list-group-item list-group-item-actions list-group-item-h"
					style="background-color: #9877f0; color: white;"> All Courses
				</a>
				<%}else{ %>
				<a href="courses.jsp?id=all"
					class="list-group-item list-group-item-actions "
					style=" color: black;"> All Courses
				</a>
				<%} %>
				<%List<Course> courseList=CourseDao.getAllCourses();
				for(Course course:courseList){%>
				<%if((request.getParameter("id")!=null)&&(request.getParameter("id").equals(course.getCourseID()))){ %>
				
				
				<a href="courses.jsp?id=<%=course.getCourseID() %>"
					class="list-group-item list-group-item-actions "
					style="background-color: #9877f0; color: white;"><%=course.getCourseName() %></a>
				<%}else{ %>	
				<a href="courses.jsp?id=<%=course.getCourseID() %>"
					class="list-group-item list-group-item-actions "
					><%=course.getCourseName() %></a>
					
					
					<%}} %>
			</div>


		</div>
		<div class="col-sm-10">
			<div class="row ">
				<div class="card-columns ml-2 mr-3">
					<!-- card-columns -->
					<%List<Course> c2list=new ArrayList<Course>();
					if(request.getParameter("id")==null||request.getParameter("id").equals("all"))
						c2list=CourseDao.getAllCourses();
					else
						c2list.add(CourseDao.getCourseById(request.getParameter("id")));
					
					%>
					<%for(Course course:c2list){ %>	
					<div class="card">
						<div class="card-header text-center">
							<%String imageName=course.getCourseID()+".png"; %>
							<a href="#"><img
								class="card-img-top img-fluid "
								src="courseImages/<%=imageName %>"
								style="width:100rem; height: 15vh;" alt="Image not available"> </a>
						</div>
						<div class="card-body">
							<h5 class="card-title">
							<b><%=course.getCourseName() %></b>
							</h5>
							<p class="card-text"><%=course.getCourseDescription() %></p>
						</div>
						<div class="card-footer container text-center">
							<div class="row text-center ml-2">
								<form action="checkout.jsp?courseId=<%=course.getCourseID().trim() %>" method="post">
									<button type="button"
										class="btn btn-outline-secondary ml-2 mr-2 disabled">
										<i class="fa fa-inr"></i><%=course.getSellingPrice() %>
										<i>
										<small>		
										<del>original price:
										<i class="fa fa-inr"></i><%=course.getOriginalPrice()%>
										</del>
										</small></i>
									</button>
									<button type="submit" class="btn btn-primary">Enroll</button>
									<input type="hidden" name="pid" value="<%= course.getCourseID()%>">
								</form>
							</div>
							<!-- end of row -->

						</div>
						<!-- end of card footer -->
					</div>
					<%} %>
				</div>
				<!-- end of card-columns -->
			</div>



		</div>

	</div>
</body>
</html>