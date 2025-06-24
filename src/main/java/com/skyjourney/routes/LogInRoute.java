package com.skyjourney.routes;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.skyjourney.controllers.UserController;
import com.skyjourney.models.User;

@WebServlet("/login")
public class LogInRoute extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String emailOrPhone = req.getParameter("email");
        String password = req.getParameter("password");

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

        UserController userController = new UserController();
        User user = userController.login(emailOrPhone, password);

        if (user != null) {
            String token = userController.generateToken();
            String encodedName = URLEncoder.encode(user.name, "UTF-8");
            String encodedEmail = URLEncoder.encode(user.email, "UTF-8");

            resp.sendRedirect(
                    "index.jsp?success=1&name=" + encodedName + "&email=" + encodedEmail + "&token=" + token);
        } else {
            resp.sendRedirect("signin.jsp?error=1&message=" + URLEncoder.encode("Invalid email or password", "UTF-8"));
        }
    }
}