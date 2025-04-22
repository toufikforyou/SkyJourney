<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            <form class="auth-form">
              <div class="form-field">
                <label for="email">Mobile</label>
                <input type="text" id="email" required />
              </div>
              <div class="form-field">
                <label for="password">Password</label>
                <input type="password" id="password" required />
              </div>
              <button type="submit" class="primary-button">Sign In</button>
              <p class="auth-links">
                <a href="#">Forgot Password?</a>
                <span>Don't have an account? <a href="#">Sign Up</a></span>
              </p>
            </form>
          </div>
        </div>
      </section>

      <%@ include file="./includes/footer.jsp" %>
  </body>

  </html>