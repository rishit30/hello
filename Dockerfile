FROM openjdk:17
WORKDIR /app
COPY . /app
RUN ./mvnw package
CMD ["java", "-jar", "target/helloworld-0.0.1-SNAPSHOT.jar"]