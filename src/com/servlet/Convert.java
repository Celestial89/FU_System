package com.servlet;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.common.Connect;
import com.common.ConvertPicSize;
import com.common.SetStartFunction;
import com.sun.media.jai.codec.ImageCodec;
import com.sun.media.jai.codec.ImageEncoder;
import com.sun.media.jai.codec.PNGEncodeParam;
import com.threads.ConvertThread;

public class Convert extends HttpServlet{

	private static final long serialVersionUID = 4010635707475331571L;
	public static ConvertThread ct;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ct = new ConvertThread(request.getSession().getServletContext().getRealPath(""));
		ct.setFlag(true);
		ct.start();
		SetStartFunction.ChangeConverting();
		response.sendRedirect("/FU_System/converting.jsp");
	}
	
	public static void convert(String server_path) throws InterruptedException {
		String imageName[] = new String[100];
		String imageFormat[] = new String[100];
		String imageFile[] = new String[100];
		String inpath = server_path +"/User/Waiting2ConvertFormat/"; //path
		String outpath = server_path +"/User/Waiting2ConvertSize/";
		String inFile[] = new String[100];
		String outFile[] =new String[100];
		
		File f = new File(inpath);
		
		String[]  filename  =  f.list();  
		
		Connection conn  = Connect.getconn();	
		Statement statement = null;
		try {
     		statement = conn.createStatement();
     	} catch (SQLException e1) {
     		e1.printStackTrace();
     	}
		
		for(int i = 0; i < filename.length; i++) { 
			int flag=0;
	        imageName[i] = filename[i].substring(0,filename[i].lastIndexOf("."));
	        imageFormat[i] = filename[i].substring(filename[i].lastIndexOf(".")+1,filename[i].length());
	     
	        //查看对应文件有没有已转换
	        String sql = "select * from member_image where imagename='" + imageName[i] + "'";
	        try {
	        	ResultSet rs =  statement.executeQuery(sql);
				if(rs.next()){
					flag = Integer.parseInt(rs.getString("converted"));	
				}	
			} catch (SQLException e1) {
				e1.printStackTrace();
			} 
			
			if(flag==0){	             
				imageFile[i] = filename[i];
	        	inFile[i]  = inpath+imageFile[i];
	            outFile[i] = outpath+imageName[i]+".png";
	            
	            try {
	            	convert2png(inFile[i],outFile[i]);
	            	ConvertPicSize.s_pic(server_path, imageName[i]+".png",imageName[i]+".png");
	            	//修改已转换图片的状态
	            	sql = "update member_image set converted=1 where imagename='"+imageName[i]+"'";
		      		try{
		      			statement.execute(sql);
		      		}catch(Exception e) {
		      			System.out.println(e.getMessage());
		      		}	
				} catch(IOException e) {
						e.printStackTrace();
				} 
			} 
		}
		Thread.sleep(30000); //转换循环 30000ms一次
	}
	       
	public static void convert2png(String inFile,String outFile) throws IOException {
        RenderedOp inrd = JAI.create("fileload", inFile);
        OutputStream outs = new FileOutputStream(outFile);
        PNGEncodeParam param = new PNGEncodeParam.RGB();
        ImageEncoder enc = ImageCodec.createImageEncoder("PNG", outs, param);
        enc.encode(inrd);
        outs.close();
    }
}
