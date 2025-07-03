# Use official Jetty with Java 17
FROM eclipse/jetty:11-jdk17

# Set working directory to Jetty webapps folder
WORKDIR /var/lib/jetty/webapps

# Copy WAR file as root.war so Jetty deploys it as the root webapp
COPY target/skyjourney.war ./root.war

# Expose Jetty port (optional, Render automatically maps ports)
EXPOSE 8080

# Jetty starts automatically; no CMD needed
