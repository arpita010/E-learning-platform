package com.servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dao.StudentDao;
import com.objects.Student;
import java.io.*;
public class SignupServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String password=request.getParameter("password");

		HttpSession session=request.getSession();
		//check for email if it already exists in db then return
		if(StudentDao.checkEmailExistence(email))
		{
			session.setAttribute("message","This Email is already registered!Try with another one...");
			response.sendRedirect("index.jsp");
			return;
		}
		Student student=new Student();
		student.setStudentEmail(email);
		student.setStudentName(username);
		student.setPassword(password);
		StudentDao.saveStudent(student);
		//message
		session.setAttribute("message","Registration successful !");
		response.sendRedirect("index.jsp");
		return;
	}
}
