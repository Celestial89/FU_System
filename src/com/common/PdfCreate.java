package com.common;

import java.io.File;
import java.io.FileOutputStream;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class PdfCreate {
	
	private String name;
	private String email;
	private String fileName;
	private String aPath;
	
	public void setP(String p) {
		this.aPath = p;
	}
	
	public PdfCreate(String name, String email, String fileName) {
		this.name = name;
		this.email = email;
		this.fileName = fileName;
	}

	public void create(){
		
		// 生成barcode图片
		Barcode bCreate = new Barcode(aPath, fileName);
		bCreate.encode();
		
		try{
			//用iText生成PDF文档需要5个步骤：
			//①建立com.lowagie.text.Document对象的实例。
			Document document = new Document(PageSize.A4);
			
			//②建立一个书写器(Writer)与document对象关联，通过书写器(Writer)可以将文档写入到磁盘中。
			String path = aPath + "/temp/" + fileName + ".pdf";
			PdfWriter.getInstance(document, new FileOutputStream(path));
			
			//③打开文档。
			document.open();
			
			//④向文档中添加内容。
			
			Paragraph p = new Paragraph("Formal Undertakings", FontFactory.getFont(FontFactory.TIMES_ROMAN, 30, Font.BOLDITALIC));
			p.setAlignment(Element.ALIGN_CENTER);
			document.add(p);
			
			Paragraph p2 = new Paragraph("Tradecert.com", FontFactory.getFont(FontFactory.TIMES_ROMAN, 15, Font.BOLD));
			p2.setAlignment(Element.ALIGN_CENTER);
			document.add(p2);
			
			document.add(Chunk.NEWLINE);
			
			Chunk t1 = new Chunk("Name:", FontFactory.getFont(FontFactory.TIMES_ROMAN, 20, Font.BOLD)); 
			document.add(t1);
			
			Chunk nameChunk = new Chunk(name ,FontFactory.getFont(FontFactory.TIMES_ROMAN, 20, Font.UNDERLINE));; 
			document.add(nameChunk);
			document.add(Chunk.NEWLINE);
			Chunk t2 = new Chunk("Email:", FontFactory.getFont(FontFactory.TIMES_ROMAN, 20, Font.BOLD)); 
			document.add(t2);
			
			Chunk emailChunk = new Chunk(email ,FontFactory.getFont(FontFactory.TIMES_ROMAN, 20, Font.UNDERLINE));; 
			document.add(emailChunk);
			document.add(Chunk.NEWLINE);
			
			//create table with 1 columns
			PdfPTable table = new PdfPTable(1);
			//100% width
			table.setWidthPercentage(100);
			table.setHorizontalAlignment(PdfPTable.ALIGN_CENTER);
			
			//create cells
			PdfPCell cell = new PdfPCell();
			cell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
			
			cell.setPhrase(new Paragraph("Document Details", FontFactory.getFont(FontFactory.TIMES_ROMAN, 18, Font.BOLD)));
			table.addCell(cell);
			
			//create another cell
			PdfPCell newcell = new PdfPCell();
			newcell.setFixedHeight(300);
			newcell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
			newcell.setPhrase(new Paragraph("Here is the details about the document.", FontFactory.getFont(FontFactory.TIMES_ROMAN, 15, Font.BOLD)));
			table.addCell(newcell);
			
			document.add(table);
			document.add(Chunk.NEWLINE);
			
			Chunk s = new Chunk("Signature:_____________", FontFactory.getFont(FontFactory.TIMES_ROMAN, 20, Font.BOLD)); 
			document.add(s);
			
			String barcode = aPath + "/temp/" + fileName + ".png";
			Image bc = Image.getInstance(barcode);
			bc.scalePercent(100);
			bc.setAlignment(Image.ALIGN_RIGHT);
			
			document.add(bc);
			
			//⑤关闭文档。
			document.close();
			
			File file = new File(barcode);
			file.delete();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
