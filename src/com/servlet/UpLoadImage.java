package com.servlet;

import com.upload.File;
import com.upload.SmartUpload;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpLoadImage extends HttpServlet
{
	private static final long serialVersionUID = 7328048173106918313L;
	
	private ServletConfig config = null;
	private String FileName = null;
	private String sPath = "/temp";
	
	public void init(ServletConfig config) throws ServletException {
		this.config = config;
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
		SmartUpload mySmartUpload = new SmartUpload();
		mySmartUpload.initialize(this.config, request, response);
		mySmartUpload.setMaxFileSize(2097152L);
		mySmartUpload.setAllowedFilesList("jpg,gif,png,jpeg,bmp");
		try {
			mySmartUpload.upload();
			File myFile = mySmartUpload.getFiles().getFile(0);
			if (!(myFile.isMissing())) {
				Date currTime = new Date();
				SimpleDateFormat formatter2 = new SimpleDateFormat("yyyyMMddhhmmssS", Locale.US);
				this.FileName = new String(formatter2.format(currTime).getBytes("iso-8859-1"));
				String ext = myFile.getFileExt();
				this.FileName = this.FileName + "." + ext;
				
				myFile.saveAs(this.sPath + "/" + this.FileName, 1);
			}
			response.sendRedirect("/FU_System/positiondefine.jsp?Picurl=" + this.FileName + "&step=2");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}