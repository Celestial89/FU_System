package com.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.common.*;

public class Download extends HttpServlet{

	private static final long serialVersionUID = 1270063323704141012L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String p = request.getSession().getServletContext().getRealPath("");
		String name = CreateFileName.createtFileName();
		PdfCreate pdfCreate = new PdfCreate(session.getAttribute("name").toString(), session.getAttribute("EmailAddress").toString(), name);
		pdfCreate.setP(p);
		pdfCreate.create();
		
		try
		{
				String filename = p + "/temp/" + name + ".pdf";
				filename = java.net.URLDecoder.decode(filename, "UTF-8");
				File file = new File(filename);
				if (file.exists())
				{
					response.setContentType("application/octet-stream");
					response.addHeader("Content-Disposition",
							"attachment;filename=" + name + ".pdf");
					response.addHeader("Content-Length", String.valueOf(file
							.length()));
					InputStream is = new FileInputStream(filename);
					OutputStream os = response.getOutputStream();
					byte[] buffer = new byte[8192];
					int count = 0;
					while ((count = is.read(buffer)) > 0)
					{
						os.write(buffer, 0, count);
					}

					os.close();
					is.close();
					
					file.delete();
				}
				Connection conn  = Connect.getconn();	
				Statement statement = conn.createStatement();
				String sql;
		  		sql = "insert into member_image (uid, imagename) values (" + Integer.parseInt(session.getAttribute("uid").toString())+ "," + name + ")";
		  		statement.executeUpdate(sql);
		  		conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
}
