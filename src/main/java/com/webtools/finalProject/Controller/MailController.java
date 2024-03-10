package com.webtools.finalProject.Controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.View;

import com.lowagie.text.DocumentException;
import com.webtools.finalProject.Pojo.User;
import com.webtools.finalProject.Pojo.TravelPackages;
import com.webtools.finalProject.Util.FilesExporter;


import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;

import org.springframework.core.env.Environment;
import org.springframework.core.io.FileSystemResource;
import java.io.File;
import java.io.IOException;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MailController {
	
	@Autowired
    private Environment environment;
	
	@Autowired 
	private FilesExporter exporter;
	
	@Autowired 
	private JavaMailSender mailSender;
	
	@PostMapping("/email.htm")
	public void sendEmail(HttpSession session, HttpServletResponse response) throws MessagingException, DocumentException, IOException {
		
		User user = (User)session.getAttribute("currentUser");
		//TravelPackages order = (TravelPackages)session.getAttribute("ordersList");
		String email = user.getEmail();
		System.out.println(email);
		
		String from = environment.getProperty("spring.mail.username");
		String to = email;
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true);
		 
		helper.setSubject("Travel Order Details");
		helper.setFrom(from);
		helper.setTo(to);
		viewreport(session,response);
		helper.setText("Please find the Order Details PDF Below", true);
		
		
		String filePath = environment.getProperty("file_path");
		
		FileSystemResource file = new FileSystemResource(new File(filePath+user.getName()+".pdf"));
		helper.addAttachment("Travel Details.pdf", file);
		
		try {
			mailSender.send(message);
		} catch (MailException e) {
			e.printStackTrace();
		}
		
	}
	
	public void viewreport(HttpSession session, HttpServletResponse response) throws MessagingException, DocumentException, IOException {
		
		User user = (User)session.getAttribute("currentUser");
		try {
			exporter.exportToPDF(user, response, session);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
