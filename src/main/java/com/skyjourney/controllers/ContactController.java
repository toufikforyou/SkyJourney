package com.skyjourney.controllers;

import com.skyjourney.services.EmailService;

public class ContactController extends EmailService {
    public boolean sendContactEmail(String name, String to, String subject, String smg) {
        String smgString = "<p>Subject: " + subject + "<br><br/>Case smg: " + smg
                + "<br><br>We will as soon as posible to reply your email.<br><br><br>Best Regards,<br>Support team, Sky Journey<br></p>";

        return this.sendEmail(to, name, subject, smgString, System.currentTimeMillis());
    }
}
