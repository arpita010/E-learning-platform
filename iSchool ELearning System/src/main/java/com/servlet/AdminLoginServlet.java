package com.servlet;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.AdminDao;
import com.objects.AdminUser;

import java.io.*;
public class AdminLoginServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		AdminUser admin=AdminDao.checkAdminLogin(email,password);
		HttpSession session=request.getSession();
		if(admin!=null)
		{
			session.setAttribute("user", admin);
			response.sendRedirect("AdminLogin.jsp");
			return;
		}
		else
		{
			//message
			session.setAttribute("message", "Invalid Credentials ! Try again..");
			response.sendRedirect("index.jsp");
			return;
		}
	}

}
