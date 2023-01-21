package com.servlet;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.StudentDao;
import com.objects.Student;
import javax.servlet.annotation.MultipartConfig;
import java.io.*;
@MultipartConfig(maxFileSize=16177215)
public class ChangeProfilePictureServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		Student student=(Student)session.getAttribute("user");
		if(student==null)
			return;
		String id=student.getStudentId();
		//file is uploaded inside UserProfilePicture folder by their student id.
		String filePath="D:\\eclipse-workspace\\iSchool ELearning System\\src\\main\\webapp\\UserProfilePictures\\"+id+".png";
		Part image=request.getPart("file");
		InputStream is=image.getInputStream();
		byte[] brr=new byte[is.available()];
		is.read(brr);
		DataOutputStream dout=new DataOutputStream(new BufferedOutputStream(new FileOutputStream(new File(filePath))));
		dout.write(brr);
		is.close();
		dout.close();
		//message
		session.setAttribute("message", "Profile picture updated successfully !!");
		response.sendRedirect("StudentLogin.jsp");
		return;
	}
}
