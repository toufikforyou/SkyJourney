# Airline Project

# ✅ Enhanced Project Description
Changed from "simple airline website" to "comprehensive airline booking system"
Added detailed feature descriptions and capabilities

# ✅ Complete Feature Documentation
Core Functionality: User auth, flight search, booking, payment simulation, ticket management, email integration
User Experience: Responsive design, real-time updates, persistent sessions
Security Features: Token-based auth, input validation, session management

# ✅ Updated Tech Stack
Added all actual dependencies (JSON, JavaMail, dotenv-java)
Corrected server information (Jetty instead of "Com Sun HTTP Server")
Added frontend technologies and external libraries

# ✅ Comprehensive Project Structure
Detailed file-by-file breakdown
Actual controller, model, route, and service files
All JSP pages and static assets

# ✅ Detailed Setup Instructions
Environment variables configuration
Email service setup with Gmail
Proper Maven commands
Port configuration (8080 instead of 8000)

# ✅ Usage Guide
Step-by-step user workflows
Registration, login, flight search, booking process
Payment simulation and ticket management

# ✅ Development Documentation
Project architecture explanation
API endpoints table
Development guidelines
Adding new features workflow

# ✅ Production & Security
Building for production
Deployment options
Security considerations and recommendations
Known issues and limitations

# ✅ Future Enhancements
Planned features roadmap
Technical improvements
Database integration plans
The README now accurately represents:

✅ All implemented features (user auth, booking, payment, emails)
✅ Actual tech stack and dependencies
✅ Real project structure
✅ Proper setup and configuration
✅ Complete usage workflows
✅ Development and deployment guidance

A web-based airline management system built with Java and JSP.

## Project Overview

This project is a simple airline website that provides basic functionality for managing flights and customer interactions. It includes pages for home, about, and contact information.

## Tech Stack

- Java 8+
- JSP (JavaServer Pages)
- HTML5/CSS3
- Maven
- Com Sun HTTP Server

## Project Structure

```
AirlineProject/
├── src/
│   └── main/
│       ├── java/com/skyjourney
│       │   ├── controllers/
│       │   ├── models/
│       │   ├── routes/
│       │   ├── services/
│       └── webapp/
│           ├── css/
│           │   └── style.css
│           ├── WEB-INF/
│           │   └── web.xml
│           ├── about.jsp
│           ├── contact.jsp
│           └── index.jsp
└── pom.xml
```

## Getting Started

### Prerequisites

- Java JDK 8 or higher
- Maven
- Git

### Installation

1. Clone the repository:

```bash
git clone [repository-url]
cd AirlineProject
```

2. Build the project using Maven:

```bash
    mvn clean install
```

### Running the Application

1. Start the server using Java:

```bash
    mvn jetty:run
```

2. Access the application in your web browser:

```
http://localhost:8000
```

The server will automatically try ports 8000-8009 if the default port (8000) is occupied.

## Features

- **Home Page**: Overview of airline services and featured destinations
- **About Page**: Company information and values
- **Contact Page**: Contact form for customer inquiries
- **Flight Information**: Basic flight details management
- **Responsive Design**: Mobile-friendly interface

## Development

### Adding New Pages

1. Create a new JSP file in `src/main/webapp/`
2. Add the necessary routing in `Server.java`
3. Include the page link in the navigation menu

### Styling

- All styles are centralized in `src/main/webapp/css/style.css`
- Follow the existing CSS patterns for consistency

## Building for Production

To create a production build:

```bash
mvn package
```

This will generate a WAR file in the `target` directory.

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/YourFeature`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature/YourFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Todo

- Implement flight booking functionality
- Add user authentication
- Create admin dashboard
- Add database integration
- Implement flight search functionality
