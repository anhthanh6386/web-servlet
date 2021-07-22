package Utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class Email {
	public void newpassword() {
		int x = (int) (Math.random() * 100000 + 9999);
		System.out.println(x);
	}

	public void sendEmail(String to, String subject, String body) {
		final String username = "thanhncph11882@fpt.edu.vn";
		final String pass = "anhthanhthanhanh";
		Properties prop = new Properties();
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		Session session = Session.getInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, pass);
			}
		});
		try {
			Message mess = new MimeMessage(session);
			mess.setFrom(new InternetAddress(username));
			mess.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			System.out.println(to);
			mess.setSubject(subject);
			mess.setText(body);
			Transport.send(mess);
			System.out.println("done");
		} catch (Exception e1) {
			e1.printStackTrace();
			System.out.println("error");
		}
	}
}
