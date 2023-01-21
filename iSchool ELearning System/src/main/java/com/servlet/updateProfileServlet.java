package com.servlet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.StudentDao;
import com.objects.Student;
public class updateProfileServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String studentID=request.getParameter("studentID");
		String email=request.getParameter("email");
		String studentName=request.getParameter("studentName");
		String contactNumber=request.getParameter("contactNumber");
		Student student=new Student();
		student.setStudentId(studentID);
		student.setStudentEmail(email);
		student.setStudentName(studentName);
		student.setContactNumber(contactNumber);
		StudentDao.updateProfile(student);
		//message
		HttpSession session=request.getSession();
		session.setAttribute("message", "Profile Updated Successfully !!");
		response.sendRedirect("StudentLogin.jsp");
		return;
	}
}
