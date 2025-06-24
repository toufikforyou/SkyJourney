package com.skyjourney.routes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.skyjourney.controllers.UserController;
import com.skyjourney.models.User;

@WebServlet("/register")
public class RegisterRoute extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String emailOrPhone = req.getParameter("email");
        String password = req.getParameter("password");

        System.out.println(name);
        System.out.println(emailOrPhone);
        System.out.println(password);
        /**
         * TODO: Implement register functionality
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

        boolean success = user.registerUser(new User(name, emailOrPhone, password));
        if (success) {
            resp.sendRedirect("/?success=1&name=" + name + "&email=" + emailOrPhone + "&token=" + user.generateToken());
        } else {
            resp.sendRedirect("/?error=1");
        }
    }
}