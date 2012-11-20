package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.common.*;
import java.sql.*;



public class Change2Start extends HttpServlet{
	
	private static final long serialVersionUID = 8574132482747565915L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		
		try{
			Connection conn  = Connect.getconn();
			Statement statement = conn.createStatement();
			String sql;
			sql= " update control set " + type + "= 0 where id=1";
			statement.execute(sql);
		}catch(Exception e){
			
		}
		response.sendRedirect("/FU_System/"+type+".jsp");	
	}
}
