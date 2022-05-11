package com.ics.servlet;



import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;



public class Email {
	
	Session newSession = null;
	MimeMessage mimeMessage = null;
	
	public void sendEmail() throws MessagingException {
		String fromUser = "leandrin.macalinao.iics@ust.edu.ph";	//Insert Email address
		String fromUserPassword = "2001may19";	//Insert Password
		String emailHost = "smtp.gmail.com";
		Transport transport = newSession.getTransport("smtp");
		transport.connect(emailHost, fromUser, fromUserPassword);
		transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
		transport.close();
	}
	
	public MimeMessage draftEmail(String email, String username, String password) throws AddressException, MessagingException {
		String emailRecepient = email;
		String emailSubject = "Forgot Password";
		String emailBody = "Your Password for account username " + username +": " + password;
		mimeMessage = new MimeMessage(newSession);
		
		mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(emailRecepient));
		mimeMessage.setSubject(emailSubject);
		
		
		MimeBodyPart bodyPart = new MimeBodyPart();
		bodyPart.setContent(emailBody, "text/html");
		MimeMultipart multiPart = new MimeMultipart();
		multiPart.addBodyPart(bodyPart);
		mimeMessage.setContent(multiPart);
		System.out.println("Email successfully sent");

		return mimeMessage;
		
	}
	
	public void setupServerProperties() {
		Properties properties = System.getProperties();
		properties.put("mail.smtp.port", "587" );
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true" );
		newSession = Session.getDefaultInstance(properties,null);

	}
}
