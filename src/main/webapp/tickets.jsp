<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SkyJourney - My Tickets</title>
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

    <section class="tickets-section">
      <div class="container">
        <div class="tickets-header">
          <h2>My Flight Tickets</h2>
          <p>Manage your flight bookings and travel history</p>
        </div>

        <div id="tickets-container">
          <div class="loading" id="tickets-loading">
            <p>Loading your tickets...</p>
          </div>

          <div class="no-tickets" id="no-tickets" style="display: none">
            <h3>No tickets found</h3>
            <p>You haven't booked any flights yet.</p>
            <a href="/" class="primary-button">Book a Flight</a>
          </div>

          <div id="tickets-list" style="display: none">
            <!-- Tickets will be populated here by JavaScript -->
          </div>
        </div>
      </div>
    </section>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        loadMyTickets();
      });

      function loadMyTickets() {
        const token = localStorage.getItem("token");
        const userEmail = localStorage.getItem("email");
        const userName = localStorage.getItem("name");

        // Check if user is logged in
        if (!token || !userEmail) {
          showLoginRequired();
          return;
        }

        // Update header with user info
        document.querySelector(".tickets-header h2").textContent =
          "My Flight Tickets - " + userName;

        // Fetch user's tickets
        fetch("./api/booking?email=" + encodeURIComponent(userEmail))
          .then((response) => {
            if (!response.ok) {
              throw new Error("HTTP error! status: " + response.status);
            }
            return response.json();
          })
          .then((data) => {
            document.getElementById("tickets-loading").style.display = "none";

            if (data.success && data.bookings && data.bookings.length > 0) {
              displayTickets(data.bookings);
            } else {
              document.getElementById("no-tickets").style.display = "block";
            }
          })
          .catch((error) => {
            console.error("Error loading tickets:", error);
            document.getElementById("tickets-loading").style.display = "none";
            showError("Failed to load tickets. Please try again.");
          });
      }

      function showLoginRequired() {
        document.getElementById("tickets-loading").style.display = "none";
        const container = document.getElementById("tickets-container");
        container.innerHTML =
          '<div class="login-required">' +
          "<h3>Login Required</h3>" +
          "<p>Please log in to view your tickets.</p>" +
          '<a href="./signin.jsp" class="primary-button">Login</a>' +
          "</div>";
      }

      function displayTickets(bookings) {
        const ticketsList = document.getElementById("tickets-list");
        let ticketsHTML = "";

        bookings.forEach((booking, index) => {
          // Generate a booking ID if not provided
          const bookingId =
            booking.bookingId ||
            "BK" + Math.random().toString(36).substr(2, 9).toUpperCase();

          // Check if this booking is already paid (from localStorage)
          const paymentKey =
            bookingId + "_" + booking.flightNumber + "_" + booking.email;
          const isPaid = localStorage.getItem(paymentKey) === "true";

          const ticketCard =
            '<div class="ticket-card" data-flight="' +
            booking.flightNumber +
            '">' +
            '<div class="ticket-header">' +
            '<div class="booking-info">' +
            "<h3>Booking ID: " +
            bookingId +
            "</h3>" +
            '<p class="flight-number">Flight ' +
            booking.flightNumber +
            "</p>" +
            "</div>" +
            '<span class="ticket-status ' +
            (isPaid ? "confirmed" : "pending") +
            '">' +
            (isPaid ? "Confirmed" : "Pending Payment") +
            "</span>" +
            "</div>" +
            '<div class="ticket-details">' +
            '<div class="detail-item">' +
            '<span class="label"><strong>Passenger: </strong></span>' +
            '<span class="value">' +
            booking.email +
            "</span>" +
            "</div>" +
            '<div class="detail-item">' +
            '<span class="label"><strong>Seat Type: </strong></span>' +
            '<span class="value">' +
            booking.seatType +
            "</span>" +
            "</div>" +
            '<div class="detail-item">' +
            '<span class="label"><strong>Price: </strong></span>' +
            '<span class="value">$' +
            booking.price +
            "</span>" +
            "</div>" +
            '<div class="detail-item">' +
            '<span class="label"><strong>Booking Date: </strong></span>' +
            '<span class="value">' +
            formatDate(booking.currentTime) +
            "</span>" +
            "</div>" +
            "</div>" +
            '<div class="ticket-actions">' +
            (isPaid
              ? '<button class="primary-button paid-btn" disabled>Paid</button>' +
                '<button class="secondary-button cancel-btn" onclick="cancelBooking(\'' +
                booking.flightNumber +
                "', '" +
                booking.email +
                "', '" +
                bookingId +
                "')\">Cancel Booking</button>"
              : '<button class="primary-button pay-now-btn" onclick="processPayment(\'' +
                booking.flightNumber +
                "', '" +
                booking.email +
                "')\">Pay Now</button>") +
            "</div>" +
            "</div>";
          ticketsHTML += ticketCard;
        });

        ticketsList.innerHTML = ticketsHTML;
        ticketsList.style.display = "block";

        // Remove auto-click functionality - let user click manually
        // No automatic payment processing
      }

      function showError(message) {
        const container = document.getElementById("tickets-container");
        container.innerHTML =
          '<div class="error-message">' +
          "<h3>Error</h3>" +
          "<p>" +
          message +
          "</p>" +
          '<button class="primary-button" onclick="location.reload()">Retry</button>' +
          "</div>";
      }

      function formatDate(dateString) {
        try {
          const date = new Date(dateString);
          return date.toLocaleDateString("en-US", {
            year: "numeric",
            month: "long",
            day: "numeric",
            hour: "2-digit",
            minute: "2-digit",
          });
        } catch (e) {
          return dateString;
        }
      }

      function processPayment(flightNumber, email) {
        // Find the ticket card for this flight
        const ticketCards = document.querySelectorAll(".ticket-card");
        let targetCard = null;

        ticketCards.forEach((card) => {
          if (card.getAttribute("data-flight") === flightNumber) {
            targetCard = card;
          }
        });

        if (targetCard) {
          // Disable the pay button and show processing
          const payButton = targetCard.querySelector(".pay-now-btn");
          payButton.textContent = "Processing...";
          payButton.disabled = true;
          payButton.style.backgroundColor = "#95a5a6";

          // Simulate payment processing
          setTimeout(() => {
            // Get booking ID from the card
            const bookingIdElement =
              targetCard.querySelector(".booking-info h3");
            const bookingId = bookingIdElement.textContent.replace(
              "Booking ID: ",
              ""
            );

            // Save payment status to localStorage with booking ID
            const paymentKey = bookingId + "_" + flightNumber + "_" + email;
            localStorage.setItem(paymentKey, "true");

            // Update status to Confirmed
            const statusSpan = targetCard.querySelector(".ticket-status");
            statusSpan.textContent = "Confirmed";
            statusSpan.className = "ticket-status confirmed";

            // Update the actions section with paid button and cancel button
            const actionsDiv = targetCard.querySelector(".ticket-actions");
            actionsDiv.innerHTML =
              '<button class="primary-button paid-btn" disabled>Paid</button>' +
              '<button class="secondary-button cancel-btn" onclick="cancelBooking(\'' +
              flightNumber +
              "', '" +
              email +
              "', '" +
              bookingId +
              "')\">Cancel Booking</button>";

            alert("Payment successful! Your ticket is now confirmed.");
          }, 2000); // 2 second delay to simulate payment processing
        }
      }

      function cancelBooking(flightNumber, email, bookingId) {
        const confirmCancel = confirm(
          "Are you sure you want to cancel this booking? This action cannot be undone."
        );

        if (confirmCancel) {
          // Remove payment status from localStorage using the provided booking ID
          const paymentKey = bookingId + "_" + flightNumber + "_" + email;
          localStorage.removeItem(paymentKey);

          // Find and remove the ticket card
          const ticketCardsToRemove = document.querySelectorAll(".ticket-card");
          ticketCardsToRemove.forEach((card) => {
            if (card.getAttribute("data-flight") === flightNumber) {
              card.style.transition = "opacity 0.5s ease, transform 0.5s ease";
              card.style.opacity = "0";
              card.style.transform = "translateX(-100%)";

              setTimeout(() => {
                card.remove();

                // Check if there are any tickets left
                const remainingTickets =
                  document.querySelectorAll(".ticket-card");
                if (remainingTickets.length === 0) {
                  document.getElementById("no-tickets").style.display = "block";
                  document.getElementById("tickets-list").style.display =
                    "none";
                }
              }, 500);
            }
          });

          alert("Booking cancelled successfully.");
        }
      }
    </script>

    <%@ include file="./includes/footer.jsp" %>
  </body>
</html>
