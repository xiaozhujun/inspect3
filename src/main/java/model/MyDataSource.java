package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDataSource {

	private static String className="com.mysql.jdbc.Driver";
	
	private String url="jdbc:mysql://localhost:3306/inspect2";
	
	private String user="root";
	
	private String password="root";
	
	static{
		try{
			Class.forName(className);
		}catch (ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public Connection getConnection(){
		Connection connection=null;
		try{
			connection=DriverManager.getConnection(url, user, password);
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return  connection;
	}
	
	
	
	
}
