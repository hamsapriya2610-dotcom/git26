# Use Eclipse Temurin Java 8 base image
FROM eclipse-temurin:8-jre-jammy

# Set the working directory inside the container
WORKDIR /app

# Copy the jar file into the container
COPY target/khadar-shoppingwebsite.jar khadar-shoppingwebsite.jar

# Expose the port used by the Spring Boot app
EXPOSE 8181

# Run the Spring Boot application
CMD ["java", "-jar", "khadar-shoppingwebsite.jar"]

