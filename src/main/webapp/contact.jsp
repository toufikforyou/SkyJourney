<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SkyJourney - Contact Us</title>
    <link rel="stylesheet" href="./css/style.css" />
    <link rel="stylesheet" href="./css/responsive.css" />
  </head>

  <body>
    <%@ include file="./includes/header.jsp" %>

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
                <input
                  type="text"
                  placeholder="Enter your full name"
                  id="name"
                  name="name"
                  required
                />
              </div>
              <div class="form-field">
                <label for="email">Email/Mobile</label>
                <input
                  type="text"
                  placeholder="Enter your email or mobile number"
                  id="email"
                  name="email"
                  required
                />
              </div>
              <div class="form-field">
                <label for="subject">Subject</label>
                <input type="text" id="subject" name="subject" required />
              </div>
              <div class="form-field">
                <label for="message">Message</label>
                <textarea
                  placeholder="Your message..."
                  id="message"
                  name="message"
                  rows="5"
                  required
                ></textarea>
              </div>
              <button type="submit" class="primary-button">Send Message</button>
            </form>
          </div>

          <div class="contact-info">
            <div class="info-card">
              <h3>Contact Information</h3>
              <p>📍 412 Uganda, Dhaka, Bangladesh.</p>
              <p>📞 +880 9638960006</p>
              <p>✉️ support@sky.toufikhasan.com</p>
              <p>🌐 sky.toufikhasan.com</p>
              <p>📅 Open: Always Open</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <script>
      const params = new URLSearchParams(window.location.search);
      if (params.get("success") === "1") {
        const div = document.createElement("div");
        div.className = "alert success";
        div.innerText = "✅ Thank you! Your message was sent successfully.";
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
