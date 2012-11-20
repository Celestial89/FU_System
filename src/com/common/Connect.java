package com.common;
import java.sql.*;


public class Connect  {

	public static Connection getconn() {
		Connection conn = null;
		
		//数据库用户名

		String userName="root";

		//密码

		String userPasswd="11302511";

		//数据库名

		String dbName="sbtradecert";

		//表名

		//String tableName="dbtest";

		//联结字符串

		String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd;
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url);
			return conn;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
	
		return conn;
	}
}
