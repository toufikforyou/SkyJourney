package com.skyjourney.controllers;

import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;

import com.skyjourney.services.SendEmailService;

import java.io.IOException;

@WebServlet("/contact")
public class ContactController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String subject = req.getParameter("subject");
        String message = req.getParameter("message");

        SendEmailService sendEmailService = new SendEmailService(name, subject, email, message);
        sendEmailService.sendEmail();

        resp.sendRedirect("contact.jsp?success=1");
    }
}