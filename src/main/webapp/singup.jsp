<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SkyJourney - Sign In</title>
    <link rel="stylesheet" href="./css/style.css" />
  </head>

  <body>
    <%@ include file="./includes/header.jsp" %>

    <section class="auth-section">
      <div class="container">
        <div class="auth-box">
          <h2>Register User</h2>
          <form class="auth-form" method="post" action="/login">
            <div class="form-field">
              <label for="name">Your name</label>
              <input
                name="name"
                type="text"
                id="name"
                placeholder="Enter your full name"
                required
              />
            </div>
            <div class="form-field">
              <label for="email">Mobile/Email</label>
              <input
                name="email"
                type="text"
                id="email"
                placeholder="Enter your email or mobile number"
                required
              />
            </div>
            <div class="form-field">
              <label for="password">Password</label>
              <input
                name="password"
                placeholder="Create a new password"
                type="password"
                id="password"
                required
              />
            </div>
            <button type="submit" class="primary-button">Register</button>
            <p class="auth-links">
              <span
                >Do you have an account? <a href="/signin.jsp">Login</a></span
              >
            </p>
          </form>
        </div>
      </div>
    </section>
    <script>
      const params = new URLSearchParams(window.location.search);

      if (params.get("success") === "1") {
        if (!localStorage.getItem("token")) {
          localStorage.setItem("token", params.get("token"));
          localStorage.setItem("name", params.get("name"));
          localStorage.setItem("email", params.get("email"));
        }

        window.history.replaceState(
          {},
          document.title,
          window.location.pathname
        );

        window.location.href = "/";
      } else if (params.get("error") === 1) {
        if (localStorage.getItem("token")) {
          localStorage.clear();
        }
        const div = document.createElement("div");
        div.className = "alert error";
        div.innerText = "-_- Login error";
        document.body.appendChild(div);

        setTimeout(() => div.remove(), 4000);
        window.history.replaceState(
          {},
          document.title,
          window.location.pathname
        );
      }
    </script>
    <%@ include file="./includes/footer.jsp" %>
  </body>
</html>
