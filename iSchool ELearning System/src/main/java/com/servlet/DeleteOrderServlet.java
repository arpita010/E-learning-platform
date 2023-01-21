package com.servlet;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.OrderDao;

import java.io.*;
public class DeleteOrderServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String delId=request.getParameter("delOrderId");
		OrderDao.deleteOrderById(delId);
		//message
		HttpSession session=request.getSession();
		session.setAttribute("message", "Order Removed succesfully!");
		response.sendRedirect("AdminLogin.jsp");
		return;
//		out.println(delId);
	}
}
