# Stage 1 — Build using Maven + Temurin JDK 23
FROM maven:3.9.9-eclipse-temurin-23 AS builder
WORKDIR /build

# Copy Maven files first for caching
COPY email-writer/pom.xml ./pom.xml
COPY email-writer/.mvn ./.mvn
COPY email-writer/mvnw ./mvnw

# Pre-download dependencies
RUN ./mvnw dependency:go-offline

# Copy source code and build
COPY email-writer/src ./src
RUN ./mvnw -B -DskipTests clean package

# Stage 2 — Runtime image with Temurin JDK 23
FROM eclipse-temurin:23-jdk-jammy
WORKDIR /app

# Copy built JAR
COPY --from=builder /build/target/*.jar ./app.jar

# Configure Render's dynamic PORT
ENV PORT=10000
EXPOSE 10000

CMD ["sh", "-c", "java -Dserver.port=$PORT -jar /app/app.jar"]