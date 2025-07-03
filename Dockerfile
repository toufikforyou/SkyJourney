# Use official Jetty 11 with Java 17
FROM jetty:11.0-jdk17

# Set working directory to Jetty webapps folder
WORKDIR /var/lib/jetty/webapps

# Copy WAR file as root.war so Jetty deploys it as root context
COPY target/skyjourney.war ./root.war

# Expose Jetty port (optional)
EXPOSE 8080
