package com.skyjourney.routes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.skyjourney.controllers.ContactController;

@WebServlet("/contact")
public class ContactRoute extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String subject = req.getParameter("subject");
        String message = req.getParameter("message");

        /**
         * Complete by Tithi Bala: Implement Contact Message functionality
         * Step 1: @Author MH TOUFIK already created a email service class for this
         * feature. Follow the class and implement the feature in here.
         * Step 2: Create a controller class that interacts with the model class to
         * handle login logic.
         * Step 3: Instantiate the controller class here and use it to validate the user
         * credentials.
         * Step 4: If login success then passing query success=1 otherwase error=1
         * Step 5: Must be implement this part @Author Tithi Bala
         */

        ContactController contactController = new ContactController();

        if (contactController.sendContactEmail(name, email, subject, message)) {
            resp.sendRedirect("contact.jsp?success=1");
        } else {
            resp.sendRedirect("contact.jsp?error=1");
        }
    }
}
