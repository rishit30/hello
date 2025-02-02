FROM openjdk:17
   COPY . /usr/src/myapp
   WORKDIR /usr/src/myapp
   RUN mvn package
   ENTRYPOINT ["java","-jar","target/my-app-1.0-SNAPSHOT.jar"]