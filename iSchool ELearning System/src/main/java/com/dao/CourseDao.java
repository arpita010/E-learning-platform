package com.dao;
import java.sql.*;
import java.util.*;

import com.objects.Course;
public class CourseDao {
	public static void saveCourse(Course course)
	{
		Connection con=DatabaseConnection.getConnection();
		try
		{
			String query="insert into courses(course_name,description,AuthorName,Duration,Original_Price,Selling_Price)values(?,?,?,?,?,?);";
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, course.getCourseName());
			pr.setString(2,course.getCourseDescription());
			pr.setString(3,course.getAuthor());
			pr.setString(4,course.getDuration());
			pr.setString(5,course.getOriginalPrice());
			pr.setString(6,course.getSellingPrice());
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static boolean courseNameOfSameAuthorExist(String courseName,String author )
	{
		String query="select * from courses where course_name=? and AuthorName=?;";
		Connection con=DatabaseConnection.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, courseName);
			pr.setString(2, author);
			ResultSet rs=pr.executeQuery();
			if(rs.next())return true;
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	public static String getCourseCount()
	{
		String count="0";
		String query="select count(*) from courses";
		Connection con=DatabaseConnection.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
				count=rs.getString(1);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	public static List<Course> getAllCourses()
	{
		List<Course> list=new ArrayList<>();
		String query="select * from courses";
		Connection con=DatabaseConnection.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				Course course =new Course();
				course.setCourseID(rs.getString("course_ID"));
				course.setCourseName(rs.getString("course_name"));
				course.setCourseDescription(rs.getString("description"));
				course.setDuration(rs.getString("Duration"));
				course.setAuthor(rs.getString("AuthorName"));
				course.setOriginalPrice(rs.getString("Original_Price"));
				course.setSellingPrice(rs.getString("Selling_Price"));
				
				list.add(course);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public static String getCourseID(String name,String author)
	{
		String id="";
		Connection con=DatabaseConnection.getConnection();
		String query="select course_ID from courses where course_name=? and AuthorName=?";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, name);
			pr.setString(2,author);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				id=rs.getString("course_ID");	
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return id;
	}
	public static Course getCourseById(String id)
	{
		Course course=new Course();
		Connection con=DatabaseConnection.getConnection();
		String query="select * from courses where course_ID=?";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, id);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				course.setCourseID(rs.getString("course_ID"));
				course.setCourseName(rs.getString("course_name"));
				course.setAuthor(rs.getString("AuthorName"));
				course.setCourseDescription(rs.getString("description"));
				course.setDuration(rs.getString("Duration"));
				course.setOriginalPrice(rs.getString("Original_Price"));
				course.setSellingPrice(rs.getString("Selling_Price"));
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return course;
	}
	public static List<Course> getEnrolledCourses(String userId)
	{
		List<Course> list=new ArrayList<>();
		Connection con=DatabaseConnection.getConnection();
		//String query= "select * from courses,purchasedcourses where courses.course_ID=purchasedcourses.courseId and purchasedcourses.userId=?; ";
		String query="select pid,courseId from purchasedcourses where userId=?";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, userId);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				Course course=new Course();
				course=CourseDao.getCourseById(rs.getString("courseId"));
				list.add(course);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public static void deleteCourse(String courseId)
	{
		//first delete all purchased records of that course 
		OrderDao.deleteRecordByCourseId(courseId);
		//then delete all chapters of that course 
		ChapterDao.deleteChaptersOfCourseId(courseId);
		//then delete course
		String query="delete from courses where course_ID=?";
		Connection con=DatabaseConnection.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, courseId);
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void editCourse(String courseId,String newName,String newAuthor)
	{
		String query="update courses set course_name=?,AuthorName=? where course_ID=?;";
		Connection con=DatabaseConnection.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, newName);
			pr.setString(2, newAuthor);
			pr.setString(3, courseId);
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
}
