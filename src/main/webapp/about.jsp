<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SkyJourney - About Us</title>
    <link rel="stylesheet" href="./css/style.css" />
  </head>

  <body>
    <%@ include file="./includes/header.jsp" %>

    <section class="about-section">
      <div class="container">
        <div class="section-title">
          <h1>About SkyJourney</h1>
          <p>Your Trusted Travel Partner</p>
        </div>

        <div class="about-content">
          <div class="about-card">
            <h2>Our Story</h2>
            <p>
              Founded in 2020, SkyJourney has grown to become one of the leading
              flight booking platforms, serving millions of travelers worldwide.
            </p>
          </div>

          <div class="about-card">
            <h2>Our Mission</h2>
            <p>
              To make air travel accessible, comfortable, and enjoyable for
              everyone by providing the best flight deals and exceptional
              service.
            </p>
          </div>

          <div class="about-stats">
            <div class="stat-item">
              <h3>1M+</h3>
              <p>Happy Customers</p>
            </div>
            <div class="stat-item">
              <h3>100+</h3>
              <p>Countries Served</p>
            </div>
            <div class="stat-item">
              <h3>500+</h3>
              <p>Airlines Partners</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <%@ include file="./includes/footer.jsp" %>
  </body>
</html>
