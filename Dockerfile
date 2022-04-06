FROM openjdk:8-jdk-alpine
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]