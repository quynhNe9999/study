FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# Copy file jar vào container
COPY target/*.jar app.jar

# Expose port
EXPOSE 8082

# Chạy app
ENTRYPOINT ["java","-jar","app.jar"]
