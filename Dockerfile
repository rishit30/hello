# Use OpenJDK 17 as base
      FROM openjdk:17

      # Set the working directory
      WORKDIR /app

      # Copy maven executable to the image
      COPY mvnw .
      COPY .mvn .mvn

      # Copy the pom.xml file
      COPY pom.xml .

      # Build all dependencies
      RUN ./mvnw dependency:go-offline -B

      # Copy your other files
      COPY src src

      # Build the project
      RUN ./mvnw package

      # Run the project
      CMD ["java", "-jar", "./target/helloworld-0.0.1-SNAPSHOT.jar"]