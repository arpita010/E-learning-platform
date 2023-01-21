package com.servlet;
import java.io.*;
import javax.servlet.http.*;

import com.dao.StudentDao;

import javax.servlet.*;
public class DeleteStudentServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String delStudentId=request.getParameter("delStudentId");
		StudentDao.deleteStudent(delStudentId);
		//message
		HttpSession session=request.getSession();
		session.setAttribute("message","Student Record Deleted successfully!!");
		response.sendRedirect("AdminStudents.jsp");
		return;
//		out.println(delStudentId);
	}
}
