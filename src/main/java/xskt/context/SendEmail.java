package xskt.context;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class SendEmail {

public String sendEmail(String email, String content)
   throws Exception {
    String kq = "false";
	// Recipient's email ID needs to be mentioned.
	final String username = "hieudvfx12877@funix.edu.vn";
	final String password = "fwklxwwkcguznixd";
	
	Properties prop = new Properties();
	prop.put("mail.smtp.host", "smtp.gmail.com");//SMTP Host
	prop.put("mail.smtp.port", "587");//TLS Port
	prop.put("mail.smtp.auth", "true");//enable authentication
	prop.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
	
	Session session = Session.getInstance(prop,
		//create Authenticator object to pass in Session.getInstance argument
        new javax.mail.Authenticator() {
			//override the getPasswordAuthentication method
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
	
	try {
	
	    Message message = new MimeMessage(session);
	    message.setFrom(new InternetAddress("hieudvfx12877@funix.edu.vn"));
	    message.setRecipients(
            Message.RecipientType.TO,
            InternetAddress.parse(email)
//	        InternetAddress.parse("to_username_a@gmail.com, to_username_b@yahoo.com")
	    );
	    message.setSubject("Testing Gmail TLS");
	    message.setText(content);
	    Transport.send(message);
	    kq = "succes";
	} catch (MessagingException e) {
	    e.printStackTrace();
	    kq = "false";
		}
	return kq;
	}
} 