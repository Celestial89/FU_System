package com.common;
import java.sql.*;


public class Connect  {

	public static Connection getconn() {
		Connection conn = null;
		
		//���ݿ��û���

		String userName="root";

		//����

		String userPasswd="11302511";

		//���ݿ���

		String dbName="sbtradecert";

		//����

		//String tableName="dbtest";

		//�����ַ���

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
