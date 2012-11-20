package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Search extends HttpServlet{

	private static final long serialVersionUID = 8368828425842394800L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		String email = request.getParameter("semail");
		request.getSession().setAttribute("cEmail", email);
		
		response.sendRedirect("/FU_System/view_admin.jsp");
	}

}
