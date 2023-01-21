package com.servlet;
import javax.servlet.*;

import javax.servlet.http.*;
import javax.servlet.annotation.*;
import com.dao.ChapterDao;
import com.objects.Chapter;

import java.io.*;
@MultipartConfig(maxFileSize=1000000000)
public class AddChapterServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();

		HttpSession session=request.getSession();
		Chapter chapter=new Chapter();
		String courseId=request.getParameter("courseID");
		String courseName=request.getParameter("courseName");
		String chapterName=request.getParameter("chapterName");
		String chapterDesc=request.getParameter("chapterDesc");
		Part chapterVideo=request.getPart("video");
		//check if chapter name already exist with same courseid!
		if(ChapterDao.chapterNameExist(chapterName, courseId))
		{
			session.setAttribute("message","This chapter name already exists!");
			response.sendRedirect("AdminLessons.jsp");
			return;
		}
		chapter.setCourseId(courseId);
		chapter.setCourseName(courseName);
		chapter.setChapterName(chapterName);
		chapter.setChapterDesc(chapterDesc);
		ChapterDao.saveChapter(chapter);
		//upload video
		String chapterId=ChapterDao.getChapterID(courseId, chapterName);
		InputStream is=chapterVideo.getInputStream();
		byte[] brr=new byte[is.available()];
		String filepath="D:\\eclipse-workspace\\iSchool ELearning System\\src\\main\\webapp\\chapterVideos\\"+"c"+courseId+"l"+chapterId+".mp4";
		is.read(brr);
		DataOutputStream dout=new DataOutputStream(new BufferedOutputStream(new FileOutputStream(new File(filepath))));
		dout.write(brr);
		is.close();
		dout.close();
		//update record
		ChapterDao.updateVideoLink(chapterId, "c"+courseId+"l"+chapterId+".mp4");
		//message
		session.setAttribute("message","Course Lesson added successfully !!!");
		response.sendRedirect("AdminLessons.jsp");
		return;
	}
}
