package com.servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

import com.dao.StudentDao;
import com.objects.Student;
public class ChangeStudentPasswordServlet extends HttpServlet{
		public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
		{
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			HttpSession session=request.getSession();
			String currentPassword=request.getParameter("currentPassword");
			String newPassword=request.getParameter("newPassword");
			String studentId=((Student)session.getAttribute("user")).getStudentId();
			StudentDao.updatePassword(studentId, currentPassword, newPassword);
			//message
			session.setAttribute("message","Password Updated successfully !!");
			response.sendRedirect("StudentLogin.jsp");
			return;
		}

}
