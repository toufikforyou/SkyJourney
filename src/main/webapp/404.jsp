<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SkyJourney - Book Flights at Best Prices</title>
    <link
      rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css"
    />
    <link
      rel="stylesheet"
      href="<%= request.getContextPath() %>/css/responsive.css"
    />

    <style>
      .error-section {
        min-height: 80vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        text-align: center;
      }

      .error-content {
        max-width: 600px;
        padding: 2rem;
      }

      .error-title {
        font-size: 8rem;
        font-weight: bold;
        margin: 0;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
      }

      .error-subtitle {
        font-size: 2rem;
        margin: 1rem 0;
        font-weight: 300;
      }

      .error-message {
        font-size: 1.2rem;
        margin: 2rem 0;
        opacity: 0.9;
        color: #cf1b24;
      }

      .btn {
        display: inline-block;
        padding: 12px 30px;
        background-color: #fff;
        color: #667eea;
        text-decoration: none;
        border-radius: 25px;
        font-weight: 600;
        transition: all 0.3s ease;
        margin-top: 1rem;
      }

      .btn:hover {
        background-color: #f8f9fa;
        transform: translateY(-2px);
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
      }
    </style>
  </head>

  <body>
    <%@ include file="./includes/header.jsp" %>

    <section class="error-section">
      <div class="container">
        <div class="error-content">
          <h1 class="error-title">404</h1>
          <h2 class="error-subtitle">Page Not Found</h2>
          <p class="error-message3">
            Sorry, the page you are looking for does not exist or has been
            moved.
          </p>
          <a href="<%= request.getContextPath() %>/" class="btn btn-primary"
            >Go to Home</a
          >
        </div>
      </div>
    </section>

    <%@ include file="./includes/footer.jsp" %>
  </body>
</html>
