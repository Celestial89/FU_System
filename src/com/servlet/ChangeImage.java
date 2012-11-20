package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangeImage extends HttpServlet{

	private static final long serialVersionUID = 5351538264890127998L;

	public void service(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
		
		String FileName = request.getParameter("filename");
		if("0".equals(request.getParameter("type")))
			response.sendRedirect("/FU_System/view_client.jsp?Picurl=" + FileName + "&step=3");
		else
			response.sendRedirect("/FU_System/view_admin.jsp?Picurl=" + FileName + "&step=3");
	}
}
