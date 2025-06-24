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
          <h2>Sign In</h2>
          <form class="auth-form" method="post" action="/login">
            <div class="form-field">
              <label for="email">Mobile/Email</label>
              <input
                placeholder="Enter your email"
                name="email"
                type="text"
                id="email"
                required
              />
            </div>
            <div class="form-field">
              <label for="password">Password</label>
              <input
                placeholder="Enter your password"
                name="password"
                type="password"
                id="password"
                required
              />
            </div>
            <button type="submit" class="primary-button">Sign In</button>
            <p class="auth-links">
              <a href="#">Forgot Password?</a>
              <span
                >Don't have an account? <a href="/singup.jsp">Sign Up</a></span
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

        // Show success message
        const div = document.createElement("div");
        div.className = "alert success";
        div.innerText = "Login successful! Redirecting...";
        document.body.appendChild(div);

        setTimeout(() => {
          div.remove();
          window.location.href = "/";
        }, 2000);
      } else if (params.get("error") === "1") {
        if (localStorage.getItem("token")) {
          localStorage.clear();
        }

        const message = params.get("message") || "Login error";
        const div = document.createElement("div");
        div.className = "alert error";
        div.innerText = message;
        document.body.appendChild(div);

        setTimeout(() => div.remove(), 5000);
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
