package com.common;    
   
import java.io.*;    
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.sun.media.jai.codec.*;


import java.awt.image.*;    
import java.awt.*;    
import java.applet.*;    
   
//缩略图类，    
//本java类能将jpg图片文件，进行等比或非等比的大小转换。    
//具体使用方法    
//s_pic(大图片路径,生成小图片路径,大图片文件名,生成小图片文名,生成小图片宽度,生成小图片高度,是否等比缩放(默认为true))    

public class ConvertPicSize {    
   
	private static String InputDir; //输入图路径    
    private static String OutputDir; //输出图路径    
    private static String InputFileName; //输入图文件名    
    private static String OutputFileName; //输出图文件名    
    private static int OutputWidth = 0; //默认输出图片宽    
    private static int OutputHeight = 0; //默认输出图片高    
    private static  boolean proportion = false; //是否等比缩放标记(默认为等比缩放)    
    
    public static boolean s_pic(String Server_Path,String InFileName,String OutFileName) {   
    	
    	//初始化变量    
        InputDir = Server_Path +"/User/Waiting2ConvertSize/"; 
        OutputDir = Server_Path +"/User/Waiting2Capture/";   
        InputFileName = InFileName;    
        OutputFileName = OutFileName;   
        
        Connection conn  = Connect.getconn();	
   	 	String sql = "select * from location_signature where type = 'signature'";
   	 	try{
   	 		Statement statement = conn.createStatement();
   	 		ResultSet rs = statement.executeQuery(sql);
   	 		if(rs.next()) {	
   	 			int width = rs.getInt("imageWidth");
   	 			int height = rs.getInt("imageHeight");
   	 			double zoom = Double.parseDouble(rs.getString("imageZoom"));
   			 
   	 			Double w = width / zoom;
   	 			Double h = height / zoom;
   			 
   	 			OutputWidth = w.shortValue();
   	 			OutputHeight = h.shortValue();
   	 		}
   	 	} catch(Exception e) {
   	 		System.out.println(e.getMessage());
   	 	}
 
        // BufferedImage image;    
        // String NewFileName;    
        // 建立输出文件对象    
        File file = new File(OutputDir + OutputFileName);    
        FileOutputStream tempout = null;    
        try {    
        	tempout = new FileOutputStream(file);    
        } catch (Exception ex) {    
        	System.out.println(ex.toString());    
        }    
        Image img = null;    
        Toolkit tk = Toolkit.getDefaultToolkit();    
        Applet app = new Applet();    
        MediaTracker mt = new MediaTracker(app);    
        try {    
        	img = tk.getImage(InputDir + InputFileName);    
        	mt.addImage(img, 0);    
        	mt.waitForID(0);    
        } catch (Exception e) {    
        	e.printStackTrace();    
        }    
   
        if (img.getWidth(null) == -1) {    
        	System.out.println(" can't read,retry!" + "<BR>");    
            return false;    
        } 
        else {    
            int new_w;    
            int new_h;    
            if (proportion == true) { //判断是否是等比缩放.    
            	//为等比缩放计算输出的图片宽度及高度    
            	double rate1 = ((double) img.getWidth(null)) / (double) OutputWidth + 0.1;    
                double rate2 = ((double) img.getHeight(null)) / (double) OutputHeight + 0.1;    
                double rate = rate1 > rate2 ? rate1 : rate2;    
                new_w = (int) (((double) img.getWidth(null)) / rate);    
                new_h = (int) (((double) img.getHeight(null)) / rate);    
            } 
            else {    
            	new_w = OutputWidth; //输出的图片宽度    
            	new_h = OutputHeight; //输出的图片高度  
            }    
            BufferedImage buffImg = new BufferedImage(new_w, new_h, BufferedImage.TYPE_INT_RGB);    
   
            Graphics g = buffImg.createGraphics();    
   
            g.setColor(Color.white);    
            g.fillRect(0, 0, new_w, new_h);    
   
            g.drawImage(img, 0, 0, new_w, new_h, null);    
            g.dispose();    
            PNGEncodeParam param = new PNGEncodeParam.RGB();
            ImageEncoder encoder = ImageCodec.createImageEncoder("PNG", tempout, param);
            try {    
            	encoder.encode(buffImg);    
            	tempout.close();    
            } catch (IOException ex) {    
            	System.out.println(ex.toString());    
            }    
        }    
        return true;    
	}    
} 