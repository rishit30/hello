FROM openjdk:17
WORKDIR /app
COPY ./mvnw .
COPY ./.mvn ./.mvn
COPY ./pom.xml .
RUN ./mvnw dependency:go-offline -B
COPY ./src ./src
RUN ./mvnw package -DskipTests
CMD ["java", "-jar", "./target/hello-0.0.1-SNAPSHOT.jar"]