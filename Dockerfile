FROM openjdk:17
    COPY . /usr/src/app
    WORKDIR /usr/src/app
    RUN ./mvnw package
    ENTRYPOINT ["java","-jar","target/helloworld-0.0.1-SNAPSHOT.jar"]