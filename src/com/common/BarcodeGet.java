package com.common;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

public class BarcodeGet {
	
	private String SRC_FILE = null; 
    private String DEST_FILE = null; 

    public BarcodeGet(String inP, String outP) {
    	this.SRC_FILE = inP;
    	this.DEST_FILE = outP;
    }
    /** 
      * ��ȡͼ���ļ� 
      * �� ImageReader 
      * @param imgPath 
      * @throws IOException 
      */ 

     @SuppressWarnings("unchecked")
	public void readUsingImageReader() throws IOException{ 

    	 String format = SRC_FILE.substring(SRC_FILE.lastIndexOf(".") + 1);
    	 
    	 int top = 0;
    	 int left = 0;
    	 
    	 Connection conn  = Connect.getconn();	
    	 String sql = "select * from location_signature where type = 'barcode'";
    	 try{
    		 Statement statement = conn.createStatement();
    		 ResultSet rs = statement.executeQuery(sql);
    		 if(rs.next()) {	
    			 int cutTop = rs.getInt("cutTop");
    			 int cutLeft = rs.getInt("cutLeft");
    			 double zoom = Double.parseDouble(rs.getString("imageZoom"));
    			 
    			 Double t = cutTop / zoom;
    			 Double l = cutLeft / zoom;
    			 
    			 top = t.shortValue();
    			 left = l.shortValue();
    		 }
    	 } catch(Exception e) {
    		 System.out.println(e.getMessage());
    	 }
    	 
         // ȡ��ͼƬ������ 

         Iterator readers = ImageIO.getImageReadersByFormatName(format); 

         ImageReader reader = (ImageReader)readers.next(); 

         // ȡ��ͼƬ������ 

         InputStream source=new FileInputStream(SRC_FILE); 

         ImageInputStream iis = ImageIO.createImageInputStream(source); 

         reader.setInput(iis, true); 

         // ͼƬ���� 

         ImageReadParam param = reader.getDefaultReadParam(); 

         Rectangle rect = new Rectangle(left, top, 400, 200); 

         param.setSourceRegion(rect); 

         BufferedImage bi = reader.read(0,param);              

         ImageIO.write(bi, "png", new File(DEST_FILE));           
     } 
}
