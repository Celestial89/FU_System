package com.common;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class SetStartFunction {
	
	public static void ChangeReading() {
		Connection conn  = Connect.getconn();	
		Statement statement = null;
		try {
			statement = conn.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String sql;
		sql = "update control set reading = 1 where id=1";
		try{
			statement.execute(sql);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static void ChangeConverting(){
		Connection conn  = Connect.getconn();	
		Statement statement = null;
		try {
			statement = conn.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String sql;
		sql = "update control set converting = 1 where id=1";
		try{
			statement.execute(sql);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}	
	}
	
	public static void ChangeSenting(){
		Connection conn  = Connect.getconn();	
		Statement statement = null;
		try {
			statement = conn.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String sql;
		sql = "update control set sending = 1 where id=1";
		try{
			statement.execute(sql);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}	
	}
}
