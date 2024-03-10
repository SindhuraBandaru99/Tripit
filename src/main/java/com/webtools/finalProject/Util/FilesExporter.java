package com.webtools.finalProject.Util;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Image;
import com.lowagie.text.pdf.PdfWriter;

import com.webtools.finalProject.Pojo.TravelPackages;
import com.webtools.finalProject.Pojo.User;

import java.awt.Color;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.core.env.Environment;


@Component
public class FilesExporter {
	
	@Autowired
    private Environment environment;
	
	
	public String setResponseHeader(HttpServletResponse response, String contentType, 
			String extension, String prefix) {
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
		String timestamp = dateFormat.format(new Date());
//		String fileName = prefix + timestamp + extension;
		String fileName = prefix + extension;
		
		response.setContentType(contentType);
		
		String headerkey = "Content-Disposition";
//		String headerValue = "attachment; filename =" + fileName;
		String headerValue = "attachment; filename =" + fileName;
		response.setHeader(headerkey, headerValue);
		return fileName;
	}
	
	public void exportToPDF(User user, HttpServletResponse response, HttpSession session) throws DocumentException, IOException {
		String filePath = environment.getProperty("file_path");
		String fileName =setResponseHeader(response, "application/pdf", ".pdf" , user.getName());
		Document document = new Document(PageSize.A4);
		String fullPath = filePath + fileName;
		FileOutputStream outputStream = new FileOutputStream(fullPath);
		PdfWriter writer = PdfWriter.getInstance(document , outputStream);
		//File if we want to download
		//PdfWriter.getInstance(document , response.getOutputStream());
		document.open();
		Paragraph para = new Paragraph();
		//TravelPackages order = session.getAttribute("ordersList");
		List<TravelPackages> orderList = (List<TravelPackages>) session.getAttribute("travelPackagesCart");
		for(TravelPackages order : orderList) {
			para.add("Package Description: "+order.getPackageDescription());
			para.add("\n");
			para.add("Package Name: "+order.getPackageName());
			para.add("\n");
			para.add("Package Price: "+Integer.toString(order.getPackagePrice()));
			para.add("\n");
			Image image = Image.getInstance(new URL(order.getImage()));
			image.scaleToFit(500f, 300f);
			para.add(image);
			para.add("\n");
			document.newPage();
			
		}
		Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
		font.setSize(18);
		font.setColor(Color.BLACK);
		//para.add((Element) session.getAttribute("totalCost"));
		para.setAlignment(Paragraph.ALIGN_CENTER);
		
		document.add(para);
		document.close();
		outputStream.close();
		writer.close();
		response.flushBuffer();
	}

	
}
