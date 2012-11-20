package com.servlet;

import com.common.Connect;
import com.threads.SaveImageThread;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SaveImage extends HttpServlet
{
	
	private static final long serialVersionUID = 6262671322125960983L;
	public static SaveImageThread sit;
  
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		sit = new SaveImageThread(request.getSession().getServletContext().getRealPath(""));
		sit.setFlag(true);
		sit.start();
		
		Connection conn  = Connect.getconn();	
		Statement statement = null;
		try {
			statement = conn.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String sql="update control set capturing=1 where id=1";
		try {
			statement.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("/FU_System/capturing.jsp");
  }
}