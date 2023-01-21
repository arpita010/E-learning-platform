package com.servlet;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.FeedbackDao;
import com.objects.Feedback;

import java.io.*;
public class SendFeedbackServlet  extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String studentID=request.getParameter("studentID");
		String feedback=request.getParameter("feedback");
		Feedback feed=new Feedback();
		feed.setStudentID(studentID);
		feed.setFeedback(feedback);
		FeedbackDao.saveFeedback(feed);
		//message
		HttpSession session=request.getSession();
		session.setAttribute("message", "Feedback sent successfully !!!");
		response.sendRedirect("StudentFeedback.jsp");
		return;
	}
}
