package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.common.*;
import java.sql.*;



public class UserModify extends HttpServlet {

	private static final long serialVersionUID = 1597097510484942766L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd");
		String username = request.getSession().getAttribute("TxtUserName").toString();
		String email = request.getParameter("email");
		request.getSession().setAttribute("email", email);
		try{
			Connection conn  = Connect.getconn();
			Statement statement = conn.createStatement();
			String sql;
			sql= " update member_info set password='"+pwd+"',email='"+email+"' where username='"+username+"'";
			System.out.println(sql);
			statement.execute(sql);
		}catch(Exception e){
			
		}
		
		 response.sendRedirect("/FU_System/usermodification.jsp");
		
		
  }
	
	
}
