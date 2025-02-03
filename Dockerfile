FROM openjdk:17
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
COPY src ./src
RUN ./mvnw package -DskipTests
CMD ["java", "-jar", "target/helloworld-0.0.1-SNAPSHOT.jar"]