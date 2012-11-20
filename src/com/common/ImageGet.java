package com.common;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

public class ImageGet {

	private String SRC_FILE = null; 
    private String DEST_FILE = null; 
    private Rectangle rect = null;

    public ImageGet(String inP, String outP, Rectangle rect) {
    	this.SRC_FILE = inP;
    	this.DEST_FILE = outP;
    	this.rect = rect;
    }
    /** 
      * 读取图像文件 
      * 用 ImageReader 
      * @param imgPath 
      * @throws IOException 
      */ 

     @SuppressWarnings("unchecked")
	public void readUsingImageReader() throws IOException{ 

    	 String format = SRC_FILE.substring(SRC_FILE.lastIndexOf(".") + 1);
    	 
         // 取得图片读入器 

         Iterator readers = ImageIO.getImageReadersByFormatName(format); 

         ImageReader reader = (ImageReader)readers.next(); 

         // 取得图片读入流 

         InputStream source=new FileInputStream(SRC_FILE); 

         ImageInputStream iis = ImageIO.createImageInputStream(source); 

         reader.setInput(iis, true); 

         // 图片参数 

         ImageReadParam param = reader.getDefaultReadParam(); 

         param.setSourceRegion(rect); 

         BufferedImage bi = reader.read(0,param);              

         ImageIO.write(bi, "png", new File(DEST_FILE));           
     } 
}
