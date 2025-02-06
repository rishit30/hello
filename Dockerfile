FROM openjdk:17
    COPY . /app
    WORKDIR /app
    RUN ./mvnw package
    CMD ["java", "-jar", "./target/helloworld-0.0.1-SNAPSHOT.jar"]