package com.threads;

import java.awt.Rectangle;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.common.Connect;
import com.common.ImageGet;

public class SaveImageThread extends Thread{
	
	private volatile boolean flag = true;
	private String server_path;
	private static int uid = 0;
	
	public SaveImageThread(String server_path){
		this.server_path = server_path;
	}
	
	public void setFlag(boolean flag) {
        this.flag = flag;
    }
	
	public synchronized void stopCurrentThread() {
        this.flag = false;
    }
	
	public void run() {
		while(flag){
			try {
				int cutTop = 0;
			    int cutLeft = 0;
			    int dropWidth = 0;
			    int dropHeight = 0;
			    int top = 0;
			    int left = 0;
			    int width = 0;
			    int height = 0;
			    String imageName[] = new String[100];
				String imageFormat[] = new String[100];
				String inpath = server_path +"/User/Waiting2Capture/"; //path
				File f = new File(inpath);
				
				String[]  filename  =  f.list();  

				Connection conn  = Connect.getconn();	
			 	Statement statement = null;
			 	try {
			 		statement = conn.createStatement();
			 	} catch (SQLException e1) {
			 		e1.printStackTrace();
			 	}
				
				for(int  i  =  0;i  <  filename.length;i++)  { 
					int flag=0;
			        imageName[i]=filename[i].substring(0,filename[i].lastIndexOf("."));
			        imageFormat[i] = filename[i].substring(filename[i].lastIndexOf(".")+1,filename[i].length());
			     
			        //查看对应文件有没有已截取
			        String   sql = "select * from member_image where imagename='"+imageName[i]+"'";
			        try {
						ResultSet rs =  statement.executeQuery(sql);
						if(rs.next()){
							flag = Integer.parseInt(rs.getString("captured"));
							uid = rs.getInt("uid");
						}	
					} catch (SQLException e1) {
						e1.printStackTrace();
					} 
					//查看文件的高度宽度
					if(flag==0){	
						try {
							ResultSet rs2 =  statement.executeQuery("select * from location_signature where type = 'signature'");
							rs2.next();
							cutTop = rs2.getInt("cutTop");
							cutLeft = rs2.getInt("cutLeft");
							dropWidth = rs2.getInt("dropWidth");
							dropHeight = rs2.getInt("dropHeight");
							double zoom = Double.parseDouble(rs2.getString("imageZoom"));
			   			 
			   	 			top = (int) (cutTop / zoom);
			   	 			left = (int) (cutLeft / zoom);
			   	 			width = (int) (dropWidth / zoom);
			   	 			height = (int) (dropHeight / zoom);
						} catch (SQLException e1) {
							e1.printStackTrace();
						}
						
						Rectangle rec = new Rectangle(left, top, width, height);

						saveSubImage(server_path+ "/User/Waiting2Capture/" + filename[i], server_path + "/User/UserSignature/" + filename[i], rec);
				    
						try {
							sql = "update member_image set captured=1 where imagename='"+imageName[i]+"'";
							statement.execute(sql);
						
							sql =" insert into member_signature (member_id,name,issend) values('"+uid+"','"+imageName[i]+"','0')";
							statement.execute(sql);
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				Thread.sleep(30000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	
	private static void saveSubImage(String srcImageFile, String descDir, Rectangle rect) throws IOException {
		ImageGet iGet = new ImageGet(srcImageFile, descDir, rect);
		iGet.readUsingImageReader();
    }
}
