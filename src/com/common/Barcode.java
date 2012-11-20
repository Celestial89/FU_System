package com.common;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Hashtable;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;

public class Barcode {

	private String aPath = null;
	private String fileName = null;
	
	public Barcode(String path, String name) {
		this.aPath = path;
		this.fileName = name;
	}
	
	public void encode() {

		String str = fileName;//¶þÎ¬ÂëÄÚÈÝ
		String path = aPath + "/temp/"  + fileName + ".png";

		BitMatrix byteMatrix;
		try {
			byteMatrix = new MultiFormatWriter().encode(str,BarcodeFormat.CODE_128, 200, 100);

			File file = new File(path);
			MatrixToImageWriter.writeToFile(byteMatrix, "png", file);
		}catch (IOException e) {
			e.printStackTrace();
		} catch (WriterException e1) {
			e1.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	public String decode(){
		String resultStr = null;
		
		try{
			//String imgPath = aPath + "/temp/"  + fileName + ".png";
			String imgPath = aPath + "/temp/"  + fileName;
			File file = new File(imgPath); 
			BufferedImage image; 
			try { 
				image = ImageIO.read(file); 
				if (image == null) { 
					System.out.println("Could not decode image"); 
				} 
				LuminanceSource source = new BufferedImageLuminanceSource(image); 
				BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source)); 
				Result result; 
				Hashtable hints= new Hashtable(); 
				hints.put(DecodeHintType.CHARACTER_SET, "GBK"); 
				result = new MultiFormatReader().decode(bitmap,hints); 
				resultStr = result.getText(); 
			}catch (IOException ioe) { 
				System.out.println(ioe.toString()); 
			}catch (ReaderException re) { 
				System.out.println(re.toString()); 
			}
			
			file.delete();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return resultStr;
	}
}
