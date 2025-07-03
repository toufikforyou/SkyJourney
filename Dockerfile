# --- Stage 1: Build WAR ---
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# --- Stage 2: Run WAR on Jetty ---
FROM jetty:11.0.15-jdk17

# Use default Jetty base directory
WORKDIR /var/lib/jetty

# Copy WAR file to webapps directory
COPY --from=builder /app/target/skyjourney.war /var/lib/jetty/webapps/root.war

# Expose Jetty port
EXPOSE 8080