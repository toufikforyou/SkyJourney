<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SkyJourney - Book Flights at Best Prices</title>
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

    <!-- Hero Section -->
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
                <option value="JFK">New York (JFK)</option>
                <option value="LAX">Los Angeles (LAX)</option>
                <option value="LHR">London (LHR)</option>
                <option value="CDG">Paris (CDG)</option>
                <option value="DXB">Dubai (DXB)</option>
                <option value="HND">Tokyo (HND)</option>
                <option value="SIN">Singapore (SIN)</option>
                <option value="SYD">Sydney (SYD)</option>
              </select>
            </div>
            <div class="search-field">
              <label>To</label>
              <select id="to-airport">
                <option value="">Select Airport</option>
                <option value="JFK">New York (JFK)</option>
                <option value="LAX">Los Angeles (LAX)</option>
                <option value="LHR">London (LHR)</option>
                <option value="CDG">Paris (CDG)</option>
                <option value="DXB">Dubai (DXB)</option>
                <option value="HND">Tokyo (HND)</option>
                <option value="SIN">Singapore (SIN)</option>
                <option value="SYD">Sydney (SYD)</option>
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

          <!-- Update flight listings section -->
          <div class="flight-listings">
            <h2>Available Flights</h2>
            <div id="flight-listings-content"></div>
          </div>
        </div>
      </div>
    </section>

    <!-- Popular Destinations Section -->
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
              style="background-image: url('/api/placeholder/300/200')"
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
              style="background-image: url('/api/placeholder/300/200')"
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
              style="background-image: url('/api/placeholder/300/200')"
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
              style="background-image: url('/api/placeholder/300/200')"
            ></div>
            <div class="destination-info">
              <h3>Dubai, UAE</h3>
              <p>Experience luxury</p>
              <div class="price">From $399</div>
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
    <script src="js/app.js"></script>
  </body>
</html>
