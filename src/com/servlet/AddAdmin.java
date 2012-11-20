package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.*;
import java.sql.*;


public class AddAdmin extends HttpServlet{

	private static final long serialVersionUID = 4756392623984005321L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	
		String username = request.getParameter("username");
		String uid = null;
	
		try{
			Connection conn  = Connect.getconn();
			Statement statement = conn.createStatement();
			String sql;
			sql = "select * from member_info where username ='"+username+"'";

			ResultSet rs = statement.executeQuery(sql);

			if(rs.next()) {	
				uid = rs.getString("uid");
			}
	  
			if(uid!=null) {
				sql= " update member_info set level='Administrator' where username='"+username+"'";
				statement.execute(sql);  
			}	
		}catch(Exception e){
		
		}
		 response.sendRedirect("/FU_System/admin.jsp");
	}
}
