package com.skyjourney.services;

import com.mailersend.sdk.MailerSend;
import com.mailersend.sdk.MailerSendResponse;
import com.mailersend.sdk.Recipient;
import com.mailersend.sdk.emails.Email;
import com.mailersend.sdk.exceptions.MailerSendException;

public class SendEmailService {

    public void sendEmail(String name, String subject, String to, String smg) {
        Long caseid = System.currentTimeMillis();

        Email email = new Email();

        email.setFrom("Sky Jaurney", caseid + "hello@test-2p0347zz3eylzdrn.mlsender.net");
        email.AddReplyTo("MH TOUFIK", "hello@toufikforyou.dev");

        Recipient recipient = new Recipient(name, to);
        Recipient recipient2 = new Recipient("Support Team", caseid + "@toufikforyou.dev");

        email.AddRecipient(recipient2);
        email.AddCc(recipient);

        email.setSubject("Case " + caseid + " Thank you! We are recived your touch.");

        String smString = "<p>Subject: " + subject + "<br><br/>Case smg: " + smg
                + "<br><br>We will as soon as posible to reply your email.<br><br><br>Best Regards,<br>Support team, Sky Journey<br></p>";

        email.setHtml(smString);

        MailerSend ms = new MailerSend();

        ms.setToken("mlsn.cdc233cf07e106ccebc4b357a7111e72dccae651a9feaef0c581f8fd7064ec3c");

        try {
            MailerSendResponse response = ms.emails().send(email);
            System.out.println(response.messageId);
        } catch (MailerSendException e) {
            e.printStackTrace();
            System.out.println(e.message);
        }
    }

}
