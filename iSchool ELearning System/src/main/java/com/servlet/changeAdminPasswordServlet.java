package com.servlet;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.AdminDao;

import java.io.*;
public class changeAdminPasswordServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String oldPassword=request.getParameter("currentPassword");
		String newPassword=request.getParameter("newPassword");
		AdminDao.updateAdminUser(oldPassword,newPassword);
		//message
		HttpSession session=request.getSession();
		session.setAttribute("message","Password Changed successfully!!");
		response.sendRedirect("AdminLogin.jsp");
		return;
	}
}
