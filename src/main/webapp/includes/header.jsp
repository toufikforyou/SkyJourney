<header>
  <div class="container">
    <div class="header-content">
      <a href="/" style="text-decoration: none">
        <div class="logo">Sky<span>Journey</span></div>
      </a>
      <nav>
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
    if (localStorage.getItem("token") != null) {
      if (window.location.pathname === "/signin.jsp") {
        window.location.href = "/";
      }

      const name = localStorage.getItem("name") || "User";
      const signinMenu = document.getElementById("login");

      const html =
        '<div class="dropdown"><a href="#" class="dropbtn">' +
        name +
        '</a><div class="dropdown-content"><a href="#" id="logout">Logout</a></div></div>';

      if (signinMenu) {
        signinMenu.innerHTML = html;

        document
          .getElementById("logout")
          .addEventListener("click", function () {
            localStorage.clear();
            window.location.reload();
          });
      }
    }
  });
</script>
