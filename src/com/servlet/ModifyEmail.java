package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.common.*;
import java.sql.*;



public class ModifyEmail extends HttpServlet {

	private static final long serialVersionUID = 8606448279768218615L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("password");
		String username = request.getParameter("username");
		String host = request.getParameter("host");
		String type = request.getParameter("type");
		
		try{
			Connection conn  = Connect.getconn();
			Statement statement = conn.createStatement();
			String sql = null;
			if(type.equals("reading"))
				sql= " update email_info set password='"+pwd+"',host='"+host+"',username='"+username+"' where id=1";
			else
				sql= " update email_info set password='"+pwd+"',host='"+host+"',username='"+username+"' where id=2";
			statement.execute(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		response.sendRedirect("/FU_System/reading.jsp");
	}
}
