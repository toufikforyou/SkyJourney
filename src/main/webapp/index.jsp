<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SkyJourney - Book Flights at Best Prices</title>
    <link rel="stylesheet" href="./css/style.css" />
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
              <div class="destination-img" style="background-image: url('./images/1.jpg')"></div>
              <div class="destination-info">
                <h3>New York, USA</h3>
                <p>The city that never sleeps</p>
                <div class="price">From $299</div>
              </div>
            </div>

            <div class="destination-card">
              <div class="destination-img" style="background-image: url('./images/2.jpg')"></div>
              <div class="destination-info">
                <h3>Paris, France</h3>
                <p>The city of love</p>
                <div class="price">From $349</div>
              </div>
            </div>

            <div class="destination-card">
              <div class="destination-img" style="background-image: url('./images/3.jpg')"></div>
              <div class="destination-info">
                <h3>Tokyo, Japan</h3>
                <p>Where tradition meets future</p>
                <div class="price">From $499</div>
              </div>
            </div>

            <div class="destination-card">
              <div class="destination-img" style="background-image: url('./images/2.jpg')"></div>
              <div class="destination-info">
                <h3>Paris, France</h3>
                <p>The city of love</p>
                <div class="price">From $349</div>
              </div>
            </div>

            <div class="destination-card">
              <div class="destination-img" style="background-image: url('./images/3.jpg')"></div>
              <div class="destination-info">
                <h3>Tokyo, Japan</h3>
                <p>Where tradition meets future</p>
                <div class="price">From $499</div>
              </div>
            </div>

            <div class="destination-card">
              <div class="destination-img" style="background-image: url('./images/1.jpg')"></div>
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

        <script src="js/app.js"></script>
  </body>

  </html>