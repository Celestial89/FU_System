package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.common.*;
import java.sql.*;



public class AdminPwdModify extends HttpServlet{

	private static final long serialVersionUID = 5412068475933008181L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pwd = request.getParameter("pwd");
		String username = request.getSession().getAttribute("TxtUserName").toString();
		try{
			Connection conn  = Connect.getconn();
			Statement statement = conn.createStatement();
			String sql;
			sql= " update member_info set password='"+pwd+"' where username='"+username+"'";
			statement.execute(sql);
		}catch(Exception e){
			
		}
		response.sendRedirect("/FU_System/admin.jsp");
	}
}
