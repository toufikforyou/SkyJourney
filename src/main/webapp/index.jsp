<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SkyJourney - Book Flights at Best Prices</title>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet" />
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="./css/style.css" />
    <link rel="stylesheet" href="./css/responsive.css" />
  </head>

  <body>
    <%@ include file="./includes/header.jsp" %>

    <section class="hero">
      <div class="container">
        <h1>Explore the World with SkyJourney</h1>
        <p>Find and book the best flight deals to your dream destinations</p>

        <div class="search-box">
          <div class="trip-type">
            <button class="trip-btn active-trip">One Way</button>
          </div>

          <div class="search-fields">
            <div class="search-field">
              <label>From</label>
              <select id="from-airport">
                <option value="">Select Airport</option>
              </select>
            </div>
            <div class="search-field">
              <label>To</label>
              <select id="to-airport">
                <option value="">Select Airport</option>
              </select>
            </div>
            <div class="search-field">
              <label>Departure</label>
              <input type="date" />
            </div>
            <div class="search-field">
              <label>Travelers & Class</label>
              <select id="class-select">
                <option value="Economy">Economy</option>
                <option value="Business">Business</option>
              </select>
            </div>
          </div>

          <button class="search-btn">Search Flights</button>

          <div class="flight-listings">
            <h2>Available Flights</h2>
            <div id="flight-listings-content"></div>
          </div>
        </div>
      </div>
    </section>

    <section class="popular-destinations">
      <div class="container">
        <div class="section-title">
          <h2>Popular Destinations</h2>
          <p>Explore our best flight deals to popular destinations</p>
        </div>

        <div class="destinations-grid">
          <div class="destination-card">
            <div
              class="destination-img"
              style="background-image: url('./images/1.jpg')"
            ></div>
            <div class="destination-info">
              <h3>New York, USA</h3>
              <p>The city that never sleeps</p>
              <div class="price">From $299</div>
            </div>
          </div>

          <div class="destination-card">
            <div
              class="destination-img"
              style="background-image: url('./images/2.jpg')"
            ></div>
            <div class="destination-info">
              <h3>Paris, France</h3>
              <p>The city of love</p>
              <div class="price">From $349</div>
            </div>
          </div>

          <div class="destination-card">
            <div
              class="destination-img"
              style="background-image: url('./images/3.jpg')"
            ></div>
            <div class="destination-info">
              <h3>Tokyo, Japan</h3>
              <p>Where tradition meets future</p>
              <div class="price">From $499</div>
            </div>
          </div>

          <div class="destination-card">
            <div
              class="destination-img"
              style="background-image: url('./images/2.jpg')"
            ></div>
            <div class="destination-info">
              <h3>Paris, France</h3>
              <p>The city of love</p>
              <div class="price">From $349</div>
            </div>
          </div>

          <div class="destination-card">
            <div
              class="destination-img"
              style="background-image: url('./images/3.jpg')"
            ></div>
            <div class="destination-info">
              <h3>Tokyo, Japan</h3>
              <p>Where tradition meets future</p>
              <div class="price">From $499</div>
            </div>
          </div>

          <div class="destination-card">
            <div
              class="destination-img"
              style="background-image: url('./images/1.jpg')"
            ></div>
            <div class="destination-info">
              <h3>New York, USA</h3>
              <p>The city that never sleeps</p>
              <div class="price">From $299</div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <%@ include file="./includes/footer.jsp" %>

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
    <script src="js/app.js"></script>
  </body>
</html>
