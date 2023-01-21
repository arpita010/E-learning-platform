package com.servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class DeleteChapterServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String delLessonId=request.getParameter("delLessonId");
		out.println(delLessonId);
	}
}
