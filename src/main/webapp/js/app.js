document.addEventListener("DOMContentLoaded", function () {
  const fromAirport = document.getElementById("from-airport");
  const toAirport = document.getElementById("to-airport");
  const searchBtn = document.querySelector(".search-btn");

  loadAirports();

  fromAirport.addEventListener("change", validateAirports);
  toAirport.addEventListener("change", validateAirports);
  searchBtn.addEventListener("click", handleSearch);

  function loadAirports() {
    fetch("./api/flights?action=airports")
      .then((response) => {
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        return response.json();
      })
      .then((airports) => {
        console.log("Loaded airports from API:", airports);
        if (airports && airports.length > 0) {
          populateAirportDropdowns(airports);
        } else {
          console.log("No airports from API, using fallback");
          populateAirportDropdowns([]);
        }
      })
      .catch((error) => {
        console.log("Error loading airports from API, using fallback:", error);
        populateAirportDropdowns([]);
      });
  }

  function populateAirportDropdowns(airports) {
    fromAirport.innerHTML = '<option value="">Select Airport</option>';
    toAirport.innerHTML = '<option value="">Select Airport</option>';

    airports.forEach((airport) => {
      const option1 = new Option(
        `${airport.name} (${airport.code})`,
        airport.code
      );
      const option2 = new Option(
        `${airport.name} (${airport.code})`,
        airport.code
      );
      fromAirport.add(option1);
      toAirport.add(option2);
    });
  }

  function handleSearch(e) {
    e.preventDefault();
    if (validateForm()) {
      searchFlights();
    }
  }

  function searchFlights() {
    const params = new URLSearchParams({
      action: "search",
      from: fromAirport.value,
      to: toAirport.value,
      date: document.querySelector('input[type="date"]').value,
    });

    console.log("Searching flights with params:", params.toString());
    showLoading();

    fetch(`./api/flights?${params}`)
      .then((response) => {
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        return response.json();
      })
      .then((flights) => {
        console.log("Found flights:", flights);
        displayFlights(flights);
      })
      .catch((error) => {
        console.error("Error searching flights:", error);
        showError();
      });
  }

  function displayFlights(flights) {
    const content = document.getElementById("flight-listings-content");

    if (flights.length === 0) {
      content.innerHTML =
        '<div class="no-flights">No flights found for your search criteria.</div>';
      return;
    }

    content.innerHTML = flights
      .map(
        (flight) => `
      <div class="flight-card">
        <div class="flight-info">
          <div class="flight-route">
            <span>${flight.from}</span>
            <span>→</span>
            <span>${flight.to}</span>
          </div>
          <div class="flight-details">
            <div class="flight-time">
              <span>📅 ${formatDate(flight.fromTime)}</span>
              <span>⏰ ${formatTime(flight.fromTime)} - ${formatTime(
          flight.toTime
        )}</span>
            </div>
            <div class="flight-number">✈️ Flight ${flight.flightNumber}</div>
          </div>
        </div>
        <div class="flight-price">$${flight.price}</div>
        <button class="select-flight-btn" onclick="selectFlight('${
          flight.flightNumber
        }', ${flight.price})">
          Select Flight
        </button>
      </div>
    `
      )
      .join("");
  }

  function showLoading() {
    const content = document.getElementById("flight-listings-content");
    content.innerHTML = '<div class="loading">Searching for flights...</div>';
    document.querySelector(".flight-listings").classList.add("show");
  }

  function showError() {
    const content = document.getElementById("flight-listings-content");
    content.innerHTML =
      '<div class="error">Error searching for flights. Please try again.</div>';
  }

  function formatTime(dateTimeString) {
    try {
      return new Date(dateTimeString).toLocaleTimeString("en-US", {
        hour: "2-digit",
        minute: "2-digit",
        hour12: false,
      });
    } catch (e) {
      return dateTimeString.split("T")[1] || dateTimeString;
    }
  }

  function formatDate(dateTimeString) {
    try {
      return new Date(dateTimeString).toLocaleDateString("en-US", {
        year: "numeric",
        month: "short",
        day: "numeric",
      });
    } catch (e) {
      return dateTimeString.split("T")[0] || dateTimeString;
    }
  }

  function validateAirports() {
    if (
      fromAirport.value &&
      toAirport.value &&
      fromAirport.value === toAirport.value
    ) {
      alert("Origin and destination airports cannot be the same");
      toAirport.value = "";
    }
  }

  function validateForm() {
    if (!fromAirport.value) {
      alert("Please select a departure airport");
      fromAirport.focus();
      return false;
    }

    if (!toAirport.value) {
      alert("Please select an arrival airport");
      toAirport.focus();
      return false;
    }

    const departureDate = document.querySelector('input[type="date"]');
    if (!departureDate.value) {
      alert("Please select a departure date");
      departureDate.focus();
      return false;
    }

    const today = new Date();
    today.setHours(0, 0, 0, 0);
    const selectedDate = new Date(departureDate.value);
    if (selectedDate < today) {
      alert("Departure date cannot be in the past");
      departureDate.focus();
      return false;
    }

    return true;
  }

  const departureDateInput = document.querySelector('input[type="date"]');
  const today = new Date().toISOString().split("T")[0];
  departureDateInput.setAttribute("min", today);
});

function selectFlight(flightNumber, price) {
  // Check if user is logged in
  const token = localStorage.getItem("token");
  const userEmail = localStorage.getItem("email");
  const userName = localStorage.getItem("name");
  
  if (!token || !userEmail) {
    // User not logged in, redirect to login page
    const confirmLogin = confirm("You need to login to book a flight. Would you like to login now?");
    if (confirmLogin) {
      window.location.href = "/signin.jsp";
    }
    return;
  }

  const selectedFlight = {
    flightNumber: flightNumber,
    price: price,
    from: document.getElementById("from-airport").value,
    to: document.getElementById("to-airport").value,
    date: document.querySelector('input[type="date"]').value,
    class: document.getElementById("class-select").value,
  };

  localStorage.setItem("selectedFlight", JSON.stringify(selectedFlight));

  const confirmMessage = `
Flight Selected Successfully!

Passenger: ${userName}
Email: ${userEmail}
Flight: ${flightNumber}
Route: ${selectedFlight.from} → ${selectedFlight.to}
Date: ${selectedFlight.date}
Class: ${selectedFlight.class}
Price: $${price}

Would you like to proceed to booking?`;

  if (confirm(confirmMessage.trim())) {
    bookFlight(selectedFlight, userEmail, userName);
  }
}

// Function to book the selected flight
function bookFlight(flightDetails, userEmail, userName) {
  const token = localStorage.getItem("token");
  
  // Show booking in progress
  const loadingDiv = document.createElement("div");
  loadingDiv.className = "alert info";
  loadingDiv.innerText = "Processing your booking...";
  document.body.appendChild(loadingDiv);
  
  const bookingData = {
    action: "book",
    flightNumber: flightDetails.flightNumber,
    email: userEmail,
    name: userName,
    seatType: flightDetails.class,
    price: flightDetails.price,
    bookingDate: flightDetails.date,
    from: flightDetails.from,
    to: flightDetails.to,
    token: token
  };

  fetch('/api/flights', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(bookingData)
  })
  .then(response => response.json())
  .then(data => {
    loadingDiv.remove();
    
    if (data.success) {
      const successDiv = document.createElement("div");
      successDiv.className = "alert success";
      successDiv.innerHTML = `
        <strong>Booking Successful!</strong><br>
        Booking ID: ${data.bookingId}<br>
        Flight: ${data.flightNumber}<br>
        A confirmation email has been sent to ${userEmail}
      `;
      document.body.appendChild(successDiv);
      
      // Clear selected flight from localStorage
      localStorage.removeItem("selectedFlight");
      
      // Remove success message and redirect after 8 seconds
      setTimeout(() => {
        successDiv.remove();
        window.location.href = './tickets.jsp';
      }, 3500);
      
    } else {
      const errorDiv = document.createElement("div");
      errorDiv.className = "alert error";
      errorDiv.innerText = `Booking Failed: ${data.message}`;
      document.body.appendChild(errorDiv);
      
      setTimeout(() => {
        errorDiv.remove();
      }, 5000);
    }
  })
  .catch(error => {
    loadingDiv.remove();
    console.error('Booking error:', error);
    
    const errorDiv = document.createElement("div");
    errorDiv.className = "alert error";
    errorDiv.innerText = 'Booking failed. Please try again.';
    document.body.appendChild(errorDiv);
    
    setTimeout(() => {
      errorDiv.remove();
    }, 5000);
  });
}
