package com.skyjourney.services;

import com.mailersend.sdk.MailerSend;
import com.mailersend.sdk.MailerSendResponse;
import com.mailersend.sdk.Recipient;
import com.mailersend.sdk.emails.Email;
import com.mailersend.sdk.exceptions.MailerSendException;

public class SendEmailService {
    String name, subject, to, smg;

    public SendEmailService(String name, String subject, String to, String smg) {
        this.name = name;
        this.subject = subject;
        this.to = to;
        this.smg = smg;
    }

    public void sendEmail() {

        Email email = new Email();

        email.setFrom("Sky Jaurney", "hello@test-vz9dlemmjd64kj50.mlsender.net");
        email.AddReplyTo("MH TOUFIK", "hello@toufikforyou.dev");

        Recipient recipient = new Recipient(this.name, this.to);
        email.AddRecipient(recipient);

        email.setSubject("Thank you! Your message was sent successfully. Your case id: " + System.currentTimeMillis());

        String smString = "<p>Subject: " + subject + "<br><br/>Case smg: " + smg
                + "<br><br>We will as soon as posible to reply your email.<br><br><br>Best Regards,<br>Support team, Sky Journey<br></p>";

        email.setHtml(smString);

        MailerSend ms = new MailerSend();

        ms.setToken("mlsn.b62a4530b0f46a27bbb96390c4f9ef89baece68795375d0a2661006ce87f594b");

        try {
            MailerSendResponse response = ms.emails().send(email);
            System.out.println(response.messageId);
        } catch (MailerSendException e) {
            e.printStackTrace();
        }
    }

}
