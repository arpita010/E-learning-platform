package com.servlet;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.CourseDao;

import java.io.*;
public class EditCourseServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String editCourseId=request.getParameter("editCourseId");
		String newName=request.getParameter("newName");
		String newAuthor=request.getParameter("newAuthor");

		HttpSession session=request.getSession();
		//check if already exist this coursename with same author name;
		if(CourseDao.courseNameOfSameAuthorExist(newName, newAuthor))
		{
			session.setAttribute("message", "This course name is already exist!Try something new.");
			response.sendRedirect("AdminCourses.jsp");
			return;
		}
		CourseDao.editCourse(editCourseId, newName, newAuthor);
		//message
		session.setAttribute("message","Course edited successfully!");
		response.sendRedirect("AdminCourses.jsp");
		return;
//		out.println(editCourseId);
	}
}
