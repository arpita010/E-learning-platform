package com.dao;
import java.sql.*;

import com.objects.AdminUser;
public class AdminDao {
	public static void updateAdminUser(String oldPassword,String newPassword)
	{
		Connection con=DatabaseConnection.getConnection();
		try
		{
			String query="update adminuser set password=? where password=?";
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1,newPassword);
			pr.setString(2,oldPassword);
			pr.execute();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static AdminUser checkAdminLogin(String email,String password)
	{
		AdminUser admin=new AdminUser();
		Connection con=DatabaseConnection.getConnection();
		String query="select * from adminuser where email=? and password=?;";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, email);
			pr.setString(2, password);
			ResultSet rs=pr.executeQuery();
			if(rs.next())
			{
				admin.setAdmin_Id(rs.getString("Admin_ID"));
				admin.setEmail(rs.getString("Email"));
				admin.setPassword(rs.getString("Password"));
				return admin;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
}
