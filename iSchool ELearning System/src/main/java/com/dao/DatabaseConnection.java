package com.dao;
import java.sql.*;
public class DatabaseConnection {
	static Connection con=null;
	static final String db_url="jdbc:mysql://127.0.0.1:3308/ELearningSystem";
	static final String username="root";
	static final String db_password="";
	public static Connection getConnection()
	{
		try
		{

			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(db_url, username, db_password);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
	
}
