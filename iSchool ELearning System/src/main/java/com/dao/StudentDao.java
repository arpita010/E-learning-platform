package com.dao;
import java.sql.*;
import java.util.*;
import com.objects.Student;
public class StudentDao {
	public static void saveStudent(Student student)
	{
		Connection con=DatabaseConnection.getConnection();
		try
		{
			String query="insert into students(Student_Name,Student_Email,password)values(?,?,?);";
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1,student.getStudentName());
			pr.setString(2,student.getStudentEmail());
			pr.setString(3, student.getPassword());
			pr.execute();
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static boolean checkEmailExistence(String email)
	{
		String query="select * from students where Student_Email=?";
		Connection con=DatabaseConnection.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, email);
			ResultSet rs=pr.executeQuery();
			if(rs.next())return true;
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	public static void updateProfile(Student student)
	{
		Connection con=DatabaseConnection.getConnection();
		String query="update students set Student_Name=?,Student_Email=?,Contact_Number=? where Student_ID=?;";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1,student.getStudentName());
			pr.setString(2,student.getStudentEmail());
			pr.setString(3,student.getContactNumber());
			pr.setString(4,student.getStudentId());
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static Student checkLoginDetails(String email,String password)
	{
		Student student=new Student();
		Connection con=DatabaseConnection.getConnection();
		String query="select * from students where Student_Email=? and password=?";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, email);
			pr.setString(2, password);
			ResultSet rs=pr.executeQuery();
			if(rs.next())
			{
				student.setStudentId(rs.getString("Student_ID"));
				student.setStudentEmail(rs.getString("Student_Email"));
				student.setStudentName(rs.getString("Student_Name"));
				student.setContactNumber(rs.getString("Contact_Number"));
				student.setPassword(rs.getString("password"));
				return student;
			}
				
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	public static String getStudentCount()
	{
		String count="0";
		Connection con=DatabaseConnection.getConnection();
		String query="select count(*) from students";
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
	public static List<Student> getAllStudents()
	{
		List<Student> list=new ArrayList<>();
		String query="select * from students";
		Connection con=DatabaseConnection.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				Student student=new Student();
				student.setStudentId(rs.getString("Student_ID"));
				student.setStudentName(rs.getString("Student_Name"));
				student.setStudentEmail(rs.getString("Student_Email"));
				student.setContactNumber(rs.getString("Contact_Number"));
				student.setPassword(rs.getString("password"));
				list.add(student);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public static void updatePassword(String studentId,String current,String newpw)
	{
		String query="update students set password=? where studentId=? and password=?";
		Connection con=DatabaseConnection.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, newpw);
			pr.setString(2, studentId);
			pr.setString(3, current);
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void deleteStudent(String studentId)
	{
		Connection con=DatabaseConnection.getConnection();
		//first delete all purchased courses of that student
		OrderDao.deletePurchasedCourses(studentId);
		//delete all feedbacks given by that user
		FeedbackDao.deleteFeedbacksByStudentId(studentId);
		//then delete student
		String query="delete from students where Student_ID=?";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, studentId);
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void editStudentDetails(String sid,String newName,String newEmail)
	{
		String query="update students set Student_Name=?,Student_Email=? where Student_ID=?";
		Connection con=DatabaseConnection.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, newName);
			pr.setString(2, newEmail);
			pr.setString(3, sid);
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	
	}
	public static String getNameById(String id)
	{
		Connection con=DatabaseConnection.getConnection();
		String query="select Student_Name from students where Student_ID=?";
		String name="";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, id);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				name=rs.getString("Student_Name");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return name;
	}
}
