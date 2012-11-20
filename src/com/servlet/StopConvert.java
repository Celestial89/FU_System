package com.servlet;

import java.io.IOException;
import java.sql.*;
import com.common.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StopConvert extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		if(Convert.ct.isAlive()){
			Convert.ct.stopCurrentThread();
		}
		
		//停止converting后在数据库改变状态
		Connection conn  = Connect.getconn();	
		Statement statement = null;
		try {
			statement = conn.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String sql;
		sql = "update control set converting=0 where id=1";
		try {
			statement.execute(sql);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}

		response.sendRedirect("/FU_System/converting.jsp");	
	}
}
