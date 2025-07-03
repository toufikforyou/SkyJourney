package com.skyjourney.services;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import io.github.cdimascio.dotenv.Dotenv;

public class EmailService {
    private final Dotenv dotenv = Dotenv.configure().ignoreIfMissing().systemProperties().load();
    private final String senderEmail = dotenv.get("EMAIL_USER");
    private final String senderPassword = dotenv.get("EMAIL_PASS");

    public boolean sendEmail(String to, String name, String subject, String msg,
            String caseId) {

        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail, "Sky Journey"));

            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(to, name));
            message.addRecipient(Message.RecipientType.CC,
                    new InternetAddress("team@toufikforyou.dev", "Sky Journey Team"));

            message.setReplyTo(
                    new InternetAddress[] { new InternetAddress("team@toufikforyou.dev", "Sky Journey Team") });

            message.setSubject(subject);
            message.setContent(msg, "text/html; charset=utf-8");
            message.setContent(msg, "text/html; charset=utf-8");

            Transport.send(message);
            System.out.println("Email sent successfully to: " + to);
            return true;

        } catch (MessagingException | UnsupportedEncodingException e) {
            System.err.println("Failed to send email: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
