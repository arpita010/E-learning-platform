package com.servlet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.FeedbackDao;
public class DeleteFeedbackServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String delFeedbackId=request.getParameter("delFeedbackId");
		FeedbackDao.deleteFeedbackById(delFeedbackId);
		//message
		HttpSession session=request.getSession();
		session.setAttribute("message","Feedback Deleted Succesfully!!");
		response.sendRedirect("AllFeedbacks.jsp");
		return;
//		out.println(delFeedbackId);
	}
}
