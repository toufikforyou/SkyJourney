<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SkyJourney - Sign In</title>
    <link rel="stylesheet" href="css/style.css" />
  </head>
  <body>
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

    <footer>
      <div class="container">
        <div class="footer-content">
          <div class="footer-column">
            <h3>Company</h3>
            <ul>
              <li><a href="#">About Us</a></li>
              <li><a href="#">Careers</a></li>
              <li><a href="#">Press</a></li>
              <li><a href="#">Blog</a></li>
            </ul>
          </div>

          <div class="footer-column">
            <h3>Help</h3>
            <ul>
              <li><a href="#">FAQs</a></li>
              <li><a href="#">Contact Us</a></li>
              <li><a href="#">Booking Guide</a></li>
              <li><a href="#">Travel Insurance</a></li>
            </ul>
          </div>

          <div class="footer-column">
            <h3>Legal</h3>
            <ul>
              <li><a href="#">Terms & Conditions</a></li>
              <li><a href="#">Privacy Policy</a></li>
              <li><a href="#">Cookie Policy</a></li>
              <li><a href="#">Flight Cancellation</a></li>
            </ul>
          </div>

          <div class="footer-column">
            <h3>Stay Connected</h3>
            <ul>
              <li><a href="#">Facebook</a></li>
              <li><a href="#">Twitter</a></li>
              <li><a href="#">Instagram</a></li>
              <li><a href="#">LinkedIn</a></li>
            </ul>
          </div>
        </div>

        <div class="copyright">
          <p>&copy; 2025 SkyJourney. All rights reserved.</p>
        </div>
      </div>
    </footer>
  </body>
</html>
