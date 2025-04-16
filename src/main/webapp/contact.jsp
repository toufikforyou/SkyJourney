<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Airline - Contact Us</title>
    <link rel="stylesheet" href="css/style.css" />
  </head>
  <body>
    <nav>
      <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="contact.jsp">Contact</a></li>
      </ul>
    </nav>

    <main>
      <div class="container">
        <h1>Contact Us</h1>
        <p>Have questions? We'd love to hear from you.</p>

        <form action="contact" method="POST">
          <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required />
          </div>

          <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required />
          </div>

          <div class="form-group">
            <label for="subject">Subject:</label>
            <input type="text" id="subject" name="subject" required />
          </div>

          <div class="form-group">
            <label for="message">Message:</label>
            <textarea id="message" name="message" rows="5" required></textarea>
          </div>

          <button type="submit">Send Message</button>
        </form>
      </div>
    </main>

    <footer>
      <p>&copy; 2025 Airline. All rights reserved.</p>
    </footer>
  </body>
</html>
