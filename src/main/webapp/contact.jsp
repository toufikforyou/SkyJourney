<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SkyJourney - Contact Us</title>
    <link rel="stylesheet" href="css/style.css" />
  </head>

  <body>
    <header>
      <div class="container">
        <div class="header-content">
          <div class="logo">Sky<span>Journey</span></div>
          <nav>
            <ul>
              <li><a href="./index.jsp">Flights</a></li>
              <li><a href="./about.jsp">About</a></li>
              <li><a href="./contact.jsp">Contact</a></li>
              <li><a href="./signin.jsp">Sign In</a></li>
            </ul>
          </nav>
        </div>
      </div>
    </header>

    <section class="contact-section">
      <div class="container">
        <div class="section-title">
          <h1>Contact Us</h1>
          <p>We're here to help and answer any questions you might have</p>
        </div>

        <div class="contact-content">
          <div class="contact-form-container">
            <form class="contact-form" action="/contact" method="POST">
              <div class="form-field">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" required />
              </div>
              <div class="form-field">
                <label for="email">Email/Mobile</label>
                <input type="text" id="email" name="email" required />
              </div>
              <div class="form-field">
                <label for="subject">Subject</label>
                <input type="text" id="subject" name="subject" required />
              </div>
              <div class="form-field">
                <label for="message">Message</label>
                <textarea id="message" name="message" rows="5" required></textarea>
              </div>
              <button type="submit" class="primary-button">Send Message</button>
            </form>
          </div>

          <div class="contact-info">
            <div class="info-card">
              <h3>Contact Information</h3>
              <p>📍 123 Airport Road, City, Country</p>
              <p>📞 +1 234 567 890</p>
              <p>✉️ support@skyjourney.com</p>
            </div>
          </div>
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