package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.Connect;

public class StopSendMail extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(SendMail.smThread.isAlive()){
			SendMail.smThread.stopCurrentThread();
		}
		
		//停止sending后在数据库改变状态
		Connection conn  = Connect.getconn();	
		Statement statement = null;
		try {
			statement = conn.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String sql;
		sql = "update control set sending = 0 where id = 1";
		try {
			statement.execute(sql);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		response.sendRedirect("/FU_System/sending.jsp");
	}
}
