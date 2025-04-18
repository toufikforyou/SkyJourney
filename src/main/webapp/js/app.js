// Wait for DOM to fully load
document.addEventListener("DOMContentLoaded", function () {
  // Validate form to prevent selecting same airport for origin and destination
  const fromAirport = document.getElementById("from-airport");
  const toAirport = document.getElementById("to-airport");
  const searchBtn = document.querySelector(".search-btn");

  // Event listeners for airport selection
  fromAirport.addEventListener("change", validateAirports);
  toAirport.addEventListener("change", validateAirports);

  // Form submission handling
  searchBtn.addEventListener("click", function (e) {
    e.preventDefault();

    // Validate form before submission
    if (!validateForm()) {
      return false;
    }

    // Collect form data
    const departureDate = document.querySelector('input[type="date"]').value;
    const travelers = document.getElementById("class-select").value;

    // Show flight listings
    const flightListings = document.querySelector(".flight-listings");
    flightListings.classList.add("show");

    // In a real app, this would be populated from server data
    const mockFlights = [
      {
        flightNumber: "SK123",
        departure: fromAirport.options[fromAirport.selectedIndex].text,
        arrival: toAirport.options[toAirport.selectedIndex].text,
        departureTime: "09:00",
        arrivalTime: "11:30",
        price: 299,
      },
      {
        flightNumber: "SK456",
        departure: fromAirport.options[fromAirport.selectedIndex].text,
        arrival: toAirport.options[toAirport.selectedIndex].text,
        departureTime: "13:00",
        arrivalTime: "15:30",
        price: 349,
      },
      {
        flightNumber: "SK789",
        departure: fromAirport.options[fromAirport.selectedIndex].text,
        arrival: toAirport.options[toAirport.selectedIndex].text,
        departureTime: "18:00",
        arrivalTime: "20:30",
        price: 279,
      },
    ];

    // Render flight listings
    const flightListingsContent = document.getElementById(
      "flight-listings-content"
    );
    flightListingsContent.innerHTML = mockFlights
      .map(
        (flight) => `
      <div class="flight-card">
        <div class="flight-info">
          <div class="flight-route">
            <span>${flight.departure}</span>
            <span>→</span>
            <span>${flight.arrival}</span>
          </div>
          <div class="flight-details">
            <div class="flight-time">
              <span>⏰ ${flight.departureTime} - ${flight.arrivalTime}</span>
            </div>
            <div class="flight-number">
              ✈️ Flight ${flight.flightNumber}
            </div>
          </div>
        </div>
        <div class="flight-price">$${flight.price}</div>
        <button class="select-flight-btn" onclick="selectFlight('${flight.flightNumber}', ${flight.price})">
          Select Flight
        </button>
      </div>
    `
      )
      .join("");
  });

  // Validate that from and to airports are different
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

  // Validate entire form before submission
  function validateForm() {
    // Check if airports are selected
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

    // Check if date is selected
    const departureDate = document.querySelector('input[type="date"]');
    if (!departureDate.value) {
      alert("Please select a departure date");
      departureDate.focus();
      return false;
    }

    // Validate date is not in the past
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

  // Set min date for departure date picker to today
  const departureDateInput = document.querySelector('input[type="date"]');
  const today = new Date().toISOString().split("T")[0];
  departureDateInput.setAttribute("min", today);
});

// Add new function for flight selection
function selectFlight(flightNumber, price) {
  alert(`Flight ${flightNumber} selected! Price: $${price}`);
  // In a real app, this would navigate to the booking page
}
