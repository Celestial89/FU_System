package com.common;    
   
import java.io.*;    
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.sun.media.jai.codec.*;


import java.awt.image.*;    
import java.awt.*;    
import java.applet.*;    
   
//����ͼ�࣬    
//��java���ܽ�jpgͼƬ�ļ������еȱȻ�ǵȱȵĴ�Сת����    
//����ʹ�÷���    
//s_pic(��ͼƬ·��,����СͼƬ·��,��ͼƬ�ļ���,����СͼƬ����,����СͼƬ���,����СͼƬ�߶�,�Ƿ�ȱ�����(Ĭ��Ϊtrue))    

public class ConvertPicSize {    
   
	private static String InputDir; //����ͼ·��    
    private static String OutputDir; //���ͼ·��    
    private static String InputFileName; //����ͼ�ļ���    
    private static String OutputFileName; //���ͼ�ļ���    
    private static int OutputWidth = 0; //Ĭ�����ͼƬ��    
    private static int OutputHeight = 0; //Ĭ�����ͼƬ��    
    private static  boolean proportion = false; //�Ƿ�ȱ����ű��(Ĭ��Ϊ�ȱ�����)    
    
    public static boolean s_pic(String Server_Path,String InFileName,String OutFileName) {   
    	
    	//��ʼ������    
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
        // ��������ļ�����    
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
            if (proportion == true) { //�ж��Ƿ��ǵȱ�����.    
            	//Ϊ�ȱ����ż��������ͼƬ��ȼ��߶�    
            	double rate1 = ((double) img.getWidth(null)) / (double) OutputWidth + 0.1;    
                double rate2 = ((double) img.getHeight(null)) / (double) OutputHeight + 0.1;    
                double rate = rate1 > rate2 ? rate1 : rate2;    
                new_w = (int) (((double) img.getWidth(null)) / rate);    
                new_h = (int) (((double) img.getHeight(null)) / rate);    
            } 
            else {    
            	new_w = OutputWidth; //�����ͼƬ���    
            	new_h = OutputHeight; //�����ͼƬ�߶�  
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