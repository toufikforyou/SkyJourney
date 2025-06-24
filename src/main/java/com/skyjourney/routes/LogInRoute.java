package com.skyjourney.routes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.skyjourney.controllers.UserController;

@WebServlet("/login")
public class LogInRoute extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String emailOrPhone = req.getParameter("email");
        String password = req.getParameter("password");

        // System.out.println(emailOrPhone);
        // System.out.println(password);
        /**
         * TODO: Implement login functionality
         * Step 1: Create a model class to represent user credentials and validation
         * logic.
         * Step 2: Create a controller class that interacts with the model class to
         * handle login logic.
         * Step 3: Instantiate the controller class here and use it to validate the user
         * credentials.
         * Step 4: If login success then passing query success=1 with name, email
         * and login token otherwase error=1
         * Step 5: Must be implement this part @Author Nasfim
         */

        UserController user = new UserController();
        
        if(user.login(emailOrPhone, password)){
            resp.sendRedirect("signin.jsp?success=1&name=MH TOUFIK&email=email@example.com&token=asdfhasjdfhsagd");
        }
        else{
            resp.sendRedirect("signin.jsp?error=1");
        }

    }

}