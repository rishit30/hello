FROM openjdk:17
      WORKDIR /app
      COPY .mvn/ .mvn
      COPY mvnw pom.xml ./
      RUN ./mvnw dependency:go-offline
      COPY src ./src
      RUN ./mvnw package
      CMD ["java", "-jar", "target/my-app-1.0.0.jar"]