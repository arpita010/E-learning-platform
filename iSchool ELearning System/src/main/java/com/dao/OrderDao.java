package com.dao;
import java.util.*;
import java.sql.*;
import com.objects.*;
public class OrderDao {
	public static void purchaseCourse(Order order)
	{
		Connection con=DatabaseConnection.getConnection();
		String query="insert into purchasedCourses(courseId,courseName,userId,userEmail,price) values(?,?,?,?,?)";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, order.getCourseId());
			pr.setString(2, order.getCourseName());
			pr.setString(3,order.getStudentId());
			pr.setString(4, order.getStudentEmail());
			pr.setString(5,order.getAmount());
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static boolean checkAlreadyPurchased(String userID,String courseID)
	{
		String query="select * from purchasedCourses where userId=? and courseId=?;";
		Connection con=DatabaseConnection.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1,userID);
			pr.setString(2, courseID);
			ResultSet rs=pr.executeQuery();
			if(rs.next())return true;
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	public static String countOrders()
	{
		String query="select count(*) from purchasedCourses;";
		Connection con=DatabaseConnection.getConnection();
		String count="0";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				count=rs.getString(1);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	public static List<Order> getAllPurchasedCourses()
	{
		List<Order> list=new ArrayList<>();
		Connection con=DatabaseConnection.getConnection();
		String query="select * from purchasedCourses;";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				Order order=new Order();
				order.setOrderId(rs.getString("pid"));
				order.setCourseId(rs.getString("courseId"));
				order.setCourseName(rs.getString("courseName"));
				order.setStudentId(rs.getString("userId"));
				order.setStudentEmail(rs.getString("userEmail"));
				order.setAmount(rs.getString("price"));
				list.add(order);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public static Order checkPaymentStatus(String orderID)
	{
		Order order=new Order();
		Connection con=DatabaseConnection.getConnection();
		String query="select * from purchasedCourses where pid=?";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, orderID);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				order.setOrderId(orderID);
				order.setCourseId(rs.getString("courseId"));
				order.setCourseName(rs.getString("courseName"));
				order.setStudentId(rs.getString("userId"));
				order.setStudentEmail(rs.getString("userEmail"));
				order.setAmount(rs.getString("price"));
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return order;
	}
	public static void deletePurchasedCourses(String studentId)
	{
		String query="delete from purchasedCourses where userId=?";
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
	public static void deleteRecordByCourseId(String courseId)
	{
		String query="delete from purchasedCourses where courseId=?";
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
	public static void deleteOrderById(String orderId)
	{
		String query="delete from purchasedCourses where pid=?";
		Connection con=DatabaseConnection.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, orderId);
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
