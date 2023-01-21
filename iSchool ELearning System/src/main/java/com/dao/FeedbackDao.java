package com.dao;
import java.sql.*; 
import com.objects.Feedback;
import java.util.*;
public class FeedbackDao {
	public static void saveFeedback(Feedback feedback)
	{
		Connection con=DatabaseConnection.getConnection();
		String query="insert into feedback(Student_ID,Feedback)values(?,?);";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, feedback.getStudentID());
			pr.setString(2, feedback.getFeedback());
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static List<Feedback> getAllFeedbacks()
	{
		List<Feedback> list=new ArrayList<>();
		String query="select * from feedback";
		Connection con=DatabaseConnection.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				Feedback fd=new Feedback();
				fd.setFeedbackID(rs.getString("feedback_id"));
				fd.setStudentID(rs.getString("Student_ID"));
				fd.setFeedback(rs.getString("Feedback"));
				list.add(fd);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public static void deleteFeedbacksByStudentId(String studentId)
	{
		String query="delete from feedback where Student_ID=?";
		Connection con=DatabaseConnection.getConnection();
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
	public static void deleteFeedbackById(String fid)
	{
		String query="delete from feedback where feedback_id=?";
		Connection con=DatabaseConnection.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, fid);
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
