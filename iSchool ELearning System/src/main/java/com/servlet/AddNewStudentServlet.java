package com.servlet;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.StudentDao;
import com.objects.Student;

import java.io.*;
public class AddNewStudentServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		Student student =new Student();
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String password=request.getParameter("password");

		HttpSession session=request.getSession();
		//check if email already exist!
		if(StudentDao.checkEmailExistence(email))
		{
		session.setAttribute("message", "This email address is already registered !");
		response.sendRedirect("AdminStudents.jsp");
		return;
		}
		student.setStudentName(username);
		student.setStudentEmail(email);
		student.setPassword(password);
		StudentDao.saveStudent(student);
		//message 
		session.setAttribute("message", "Student registered successfully!!");
		response.sendRedirect("AdminStudents.jsp");
		return;
	}
}
