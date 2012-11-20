package com.servlet;

import java.io.IOException;
import java.sql.*;
import com.common.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StopReading extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		if(PraseMimeMessage.mt.isAlive()) {
			PraseMimeMessage.mt.stopCurrentThread();
			//PraseMimeMessage.sfnt.stop();
		}
		
		//ֹͣreading�������ݿ�ı�״̬
		Connection conn  = Connect.getconn();	
		Statement statement = null;
		try {
			statement = conn.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String sql;
		sql = "update control set reading=0 where id=1";
		try {
			statement.execute(sql);
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		 response.sendRedirect("/FU_System/reading.jsp");	
	}
}
