<header>
  <div class="container">
    <div class="header-content">
      <a href="/" style="text-decoration: none">
        <div class="logo">Sky<span>Journey</span></div>
      </a>

      <!-- Mobile Menu Toggle Button -->
      <button class="mobile-menu-toggle" id="mobile-menu-toggle">
        <div class="hamburger" id="hamburger">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </button>

      <!-- Mobile Overlay -->
      <div class="mobile-overlay" id="mobile-overlay"></div>

      <nav id="mobile-nav">
        <ul>
          <li><a href="./">Flights</a></li>
          <li><a href="./about.jsp">About</a></li>
          <li><a href="./contact.jsp">Contact</a></li>
          <li id="login"><a href="./signin.jsp">Sign In</a></li>
        </ul>
      </nav>
    </div>
  </div>
</header>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    // Mobile Menu Toggle Functionality
    const mobileMenuToggle = document.getElementById("mobile-menu-toggle");
    const mobileNav = document.getElementById("mobile-nav");
    const hamburger = document.getElementById("hamburger");
    const mobileOverlay = document.getElementById("mobile-overlay");
    const dropdownMenus = document.querySelectorAll(".dropdown");

    // Toggle mobile menu
    if (mobileMenuToggle) {
      mobileMenuToggle.addEventListener("click", function () {
        mobileNav.classList.toggle("active");
        hamburger.classList.toggle("active");
        mobileOverlay.classList.toggle("active");
        document.body.classList.toggle("menu-open");
      });
    }

    // Close mobile menu when overlay is clicked
    if (mobileOverlay) {
      mobileOverlay.addEventListener("click", function () {
        mobileNav.classList.remove("active");
        hamburger.classList.remove("active");
        mobileOverlay.classList.remove("active");
        document.body.classList.remove("menu-open");
      });
    }

    // Handle dropdown menus in mobile
    dropdownMenus.forEach(function (dropdown) {
      const dropbtn = dropdown.querySelector(".dropbtn");
      if (dropbtn) {
        dropbtn.addEventListener("click", function (e) {
          e.preventDefault();
          dropdown.classList.toggle("active");
        });
      }
    });

    // Close mobile menu when window is resized to desktop
    window.addEventListener("resize", function () {
      if (window.innerWidth > 768) {
        mobileNav.classList.remove("active");
        hamburger.classList.remove("active");
        mobileOverlay.classList.remove("active");
        document.body.classList.remove("menu-open");
      }
    });

    // Existing login functionality
    if (localStorage.getItem("token") != null) {
      if (window.location.pathname === "/signin.jsp") {
        window.location.href = "/";
      }

      const name = localStorage.getItem("name") || "User";
      const signinMenu = document.getElementById("login");

      const html =
        '<div class="dropdown"><a href="#" class="dropbtn">' +
        name +
        '</a><div class="dropdown-content"><a href="/tickets.jsp">My Tickets</a><a href="#" id="logout">Logout</a></div></div>';

      if (signinMenu) {
        signinMenu.innerHTML = html;

        document
          .getElementById("logout")
          .addEventListener("click", function () {
            localStorage.clear();
            window.location.reload();
          });

        // Re-add dropdown functionality for the new dropdown
        const newDropdown = signinMenu.querySelector(".dropdown");
        if (newDropdown) {
          const dropbtn = newDropdown.querySelector(".dropbtn");
          if (dropbtn) {
            dropbtn.addEventListener("click", function (e) {
              e.preventDefault();
              newDropdown.classList.toggle("active");
            });
          }
        }
      }
    }
  });
</script>
