package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.SetStartFunction;
import com.threads.SendMailThread;

public class SendMail extends HttpServlet{

	private static final long serialVersionUID = 5478710879845582801L;
	public static SendMailThread smThread;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		
		smThread = new SendMailThread(request);
		smThread.setFlag(true);
		smThread.start();
		
		SetStartFunction.ChangeSenting();
		response.sendRedirect("/FU_System/sending.jsp");
	}
}

