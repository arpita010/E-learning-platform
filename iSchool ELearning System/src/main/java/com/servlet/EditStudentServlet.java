package com.servlet;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.StudentDao;

import java.io.*;
public class EditStudentServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String editStudentId=request.getParameter("editStudentId");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		StudentDao.editStudentDetails(editStudentId, name, email);
		//message
		HttpSession session=request.getSession();
		session.setAttribute("message", "Student Details edited successfully!!");
		response.sendRedirect("AdminStudents.jsp");
		return;
//		out.println(editStudentId);
	}
}
