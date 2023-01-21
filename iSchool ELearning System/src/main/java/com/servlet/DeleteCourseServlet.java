package com.servlet;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.CourseDao;

import java.io.*;
public class DeleteCourseServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String delCourseId=request.getParameter("delCourseId");
		CourseDao.deleteCourse(delCourseId);
		//message
		HttpSession session=request.getSession();
		session.setAttribute("message", "Course Record deleted succesfully...");
		response.sendRedirect("AdminCourses.jsp");
		return;
//		out.println(delCourseId);
	}
}
