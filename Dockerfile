# Stage 1: Build
FROM maven:3.8-jdk-8 AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run
FROM tomcat:9.0-jre8-slim
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY --from=builder /app/target/skyjourney.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080