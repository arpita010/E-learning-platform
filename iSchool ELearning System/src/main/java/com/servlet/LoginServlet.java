package com.servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dao.StudentDao;
import com.objects.Student;

import java.io.*;
public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		Student user=new Student();
		user=StudentDao.checkLoginDetails(email, password);
		if(user!=null)
		{
			//login
			session.setAttribute("user", user);
			response.sendRedirect("StudentLogin.jsp");
			return;
		}
		else
		{
			//message
			session.setAttribute("message","Invalid Login credentials ! Try again.");
			response.sendRedirect("index.jsp");
			return;
		}
	}
}
