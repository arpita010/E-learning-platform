package com.servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dao.CourseDao;
import com.objects.Course;
import java.io.*;
import javax.servlet.annotation.MultipartConfig;
@MultipartConfig(maxFileSize=16177215)
public class AddCourseServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		Course course = new Course();
		String courseName=request.getParameter("courseName");
		String courseDesc=request.getParameter("courseDesc");
		String author=request.getParameter("author");
		String duration=request.getParameter("duration");
		String originalPrice=request.getParameter("originalPrice");
		String sellingPrice=request.getParameter("sellingPrice");
		Part courseImage=request.getPart("courseImage");
		//check if coursename of same author already exist!
		//if its true return back
		if(CourseDao.courseNameOfSameAuthorExist(courseName, author))
		{
			session.setAttribute("message","This course name is already exist.");
			response.sendRedirect("AdminCourses.jsp");
			return;
		}
		
		
		
		course.setCourseName(courseName);
		course.setCourseDescription(courseDesc);
		course.setAuthor(author);
		course.setDuration(duration);
		course.setOriginalPrice(originalPrice);
		course.setSellingPrice(sellingPrice);
		CourseDao.saveCourse(course);
		//get id of course for saving image
		String id=CourseDao.getCourseID(courseName,author);
		//file path where image is going to save i.e. courseImage folder
		String filePath="D:\\eclipse-workspace\\iSchool ELearning System\\src\\main\\webapp\\courseImages\\"+id+".png";
		InputStream is=courseImage.getInputStream();
		byte[] brr=new byte[is.available()];
		is.read(brr);
		DataOutputStream dout=new DataOutputStream(new BufferedOutputStream(new FileOutputStream(new File(filePath))));
		dout.write(brr);
		is.close();
		dout.close();
		//image saved successfully;	
		session.setAttribute("message","Course added successfully!!!");
		response.sendRedirect("AdminCourses.jsp");
		return;
	}
}
