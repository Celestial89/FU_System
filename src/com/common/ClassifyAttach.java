package com.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ClassifyAttach {

	private String path = null;
	
	public ClassifyAttach(String path) {
		this.path = path;
	}
	
	public ArrayList<String> classify() {
		File file = new File(path + "/User/temp");
		String[] fileList = file.list();
		ArrayList<String> fileName = new ArrayList<String>();
		
		for(int i = 0; i < fileList.length; i++) {
			fileName.add(fileList[i]);
			
			try {
				BarcodeGet bGet = new BarcodeGet(path + "/User/temp/" + fileList[i], path + "/temp/" + fileList[i]);
				bGet.readUsingImageReader();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			Barcode bc = new Barcode(path, fileList[i]);
			String name = bc.decode();
			
			try { 
				int bytesum = 0; 
				int byteread = 0; 
				File oldfile = new File(path + "/User/temp/" + fileList[i]); 
				if (oldfile.exists()) { //文件存在时 
					InputStream inStream = new FileInputStream(path + "/User/temp/" + fileList[i]); //读入原文件 
					String format = fileList[i].substring(fileList[i].lastIndexOf("."));
					FileOutputStream fs = new FileOutputStream(path + "/User/Waiting2ConvertFormat/" + name + format); 
					byte[] buffer = new byte[1444]; 
					while ((byteread = inStream.read(buffer)) != -1) { 
						bytesum += byteread; //字节数 文件大小  
						fs.write(buffer, 0, byteread); 
					} 
					fs.flush();
					inStream.close(); 
					fs.close();
				} 
			}catch (Exception e) { 
				System.out.println("复制单个文件操作出错"); 
				e.printStackTrace(); 
			} 
			
			Connection conn  = Connect.getconn();	
			Statement statement;
			try {
				statement = conn.createStatement();
				String sql;
		  		sql = "update member_image set received = 1 where imagename = " + name;
		  		statement.executeUpdate(sql);
		  		conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return fileName;
	}
}
