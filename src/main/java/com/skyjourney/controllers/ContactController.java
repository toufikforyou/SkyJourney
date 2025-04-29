package com.skyjourney.controllers;

import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;
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

        resp.getWriter().println("<h2>Contact Message Received</h2>");
        resp.getWriter().println("<p><strong>Name:</strong> " + name + "</p>");
        resp.getWriter().println("<p><strong>Email:</strong> " + email + "</p>");
        resp.getWriter().println("<p><strong>Subject:</strong> " + subject + "</p>");
        resp.getWriter().println("<p><strong>Message:</strong> " + message + "</p>");
    }
}
