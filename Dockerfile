# FROM eclipse-temurin:17-jre-alpine
# WORKDIR /app
# COPY target/task-manager-api-0.0.1-SNAPSHOT.jar app.jar
# EXPOSE 8080
# ENTRYPOINT ["java","-jar","app.jar"]

# Stage 1 - Build
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests
# Stage 2 - Runtime
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=builder /app/target/task-manager-api-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]