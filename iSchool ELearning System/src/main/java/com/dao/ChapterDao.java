package com.dao;
import java.sql.*; 
import com.objects.Chapter;
import java.util.*;
public class ChapterDao {
	public static void saveChapter(Chapter chapter)
	{
		Connection con=DatabaseConnection.getConnection();
		try
		{
			String query="insert into courseChapters(course_ID,course_name,chapter_name,chapter_description,video_link)values(?,?,?,?,?);";
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, chapter.getCourseId());
			pr.setString(2, chapter.getCourseName());
			pr.setString(3,chapter.getChapterName());
			pr.setString(4,chapter.getChapterDesc());
			pr.setString(5,chapter.getVideoLink());
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static boolean chapterNameExist(String name,String courseID)
	{
		String query="select * from coursechapters where chapter_name=? and course_ID=?;";
		Connection con=DatabaseConnection.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, name);
			pr.setString(2, courseID);
			ResultSet rs=pr.executeQuery();
			if(rs.next())return true;
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		return false;
	}
	public static List<Chapter> allChapters(String courseId)
	{
		List<Chapter> list=new ArrayList<>();
		Connection con=DatabaseConnection.getConnection();
		String query="select * from courseChapters where course_ID=?";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, courseId);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				Chapter ch=new Chapter();
				ch.setChapterId(rs.getString("chapter_Id"));
				ch.setChapterName(rs.getString("chapter_name"));
				ch.setChapterDesc(rs.getString("chapter_description"));
				ch.setCourseId(courseId);
				ch.setCourseName(rs.getString("course_name"));
				ch.setVideoLink(rs.getString("video_link"));
				list.add(ch);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public static List<Chapter> getchaptersByCourseId(String courseID)
	{
		List<Chapter> list=new ArrayList<>();
		Connection con=DatabaseConnection.getConnection();
		String query="select * from courseChapters where course_ID=?;";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, courseID);
			ResultSet rs=pr.executeQuery();			
			while(rs.next())
			{
				Chapter ch=new Chapter();
				ch.setChapterId(rs.getString("chapter_Id"));
				ch.setChapterName(rs.getString("chapter_name"));
				ch.setChapterDesc(rs.getString("chapter_description"));
				ch.setVideoLink(rs.getString("video_link"));
				list.add(ch);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public static String getChapterID(String courseId,String chapterName)
	{
		String cid="";
		String query="select chapter_Id from courseChapters where course_ID=? and chapter_name=?;";
		Connection con=DatabaseConnection.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, courseId);
			pr.setString(2, chapterName);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				cid=rs.getString("chapter_Id");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return cid;
	}
	public static void updateVideoLink(String cid,String link)
	{
		String query="update coursechapters set video_link=? where chapter_Id=?";
		Connection con=DatabaseConnection.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, link);
			pr.setString(2, cid);
			pr.execute();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void deleteChaptersOfCourseId(String courseId)
	{
		String query="delete from coursechapters where course_ID=?";
		Connection con=DatabaseConnection.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1,courseId);
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	
	}
}
