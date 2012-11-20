package com.servlet;

import java.awt.Rectangle;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.*;

public class PositionSave extends HttpServlet{

	private static final long serialVersionUID = 124371895607132029L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int top = 0;
	    int left = 0;
	    int width = 0;
	    int height = 0;
	    
		int imageWidth = Integer.parseInt(request.getParameter("txt_width"));
		int imageHeight = Integer.parseInt(request.getParameter("txt_height"));
	    int cutTop = Integer.parseInt(request.getParameter("txt_top"));
	    int cutLeft = Integer.parseInt(request.getParameter("txt_left"));
	    int dropWidth = Integer.parseInt(request.getParameter("txt_DropWidth"));
	    int dropHeight = Integer.parseInt(request.getParameter("txt_DropHeight"));
	    String imageZoom = request.getParameter("txt_Zoom");
	    String selected = request.getParameter("select");
	    String picture = request.getParameter("picture");

	    double zoom = Double.parseDouble(imageZoom);
	    top = (int) (cutTop / zoom);
		left = (int) (cutLeft / zoom);
		width = (int) (dropWidth / zoom);
		height = (int) (dropHeight / zoom);

	    Rectangle rec = new Rectangle(left, top, width, height);
	    String p = request.getSession().getServletContext().getRealPath("");
	    
	    saveSubImage(p + "/temp/" + picture, p + "/temp/" + picture, rec);
	    
	    Connection conn  = Connect.getconn();	
		Statement statement;
		try {
			statement = conn.createStatement();
			String sql = "delete from location_signature where type = '" + selected + "'";
			statement.executeUpdate(sql);
			sql = "insert into location_signature (imageWidth, imageHeight, cutTop, cutLeft, " +
					"dropWidth, dropHeight, imageZoom, type) values (" + imageWidth + ", " + imageHeight + "," +
					cutTop + ", " + cutLeft + ", " + dropWidth + ", " + dropHeight + ", '" + imageZoom + "', '" + selected + "')";
		  	statement.executeUpdate(sql);
		  	conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	    response.sendRedirect("/FU_System/positiondefine.jsp?Picurl=" + picture + "&step=3");
	}
	
	private static void saveSubImage(String srcImageFile, String descDir, Rectangle rect) throws IOException {
		ImageGet iGet = new ImageGet(srcImageFile, descDir, rect);
		iGet.readUsingImageReader();
    }
}
	    

