package com.servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

import com.dao.OrderDao;
import com.objects.Order;
import com.objects.Student;
public class CheckoutServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String email=request.getParameter("email");
		String courseName=request.getParameter("courseName");
		String amount=request.getParameter("amount");
		String courseId=request.getParameter("courseId");
		String studentId=((Student)session.getAttribute("user")).getStudentId();
		//check if already purchased!
		if(OrderDao.checkAlreadyPurchased(studentId, courseId))
		{
			session.setAttribute("message", "You have already enrolled in this course!");
			response.sendRedirect("StudentMyCourses.jsp");
			return;
		}
		Order order=new Order();
		order.setCourseId(courseId);
		order.setCourseName(courseName);
		order.setStudentId(studentId);
		order.setStudentEmail(email);
		order.setAmount(amount);
		OrderDao.purchaseCourse(order);
		//message
		session.setAttribute("message","Payment Successful !! Thank you..");
		response.sendRedirect("courses.jsp");
		return;
	}
}
