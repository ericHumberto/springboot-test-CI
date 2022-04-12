#FROM openjdk:8-jdk-alpine
#FROM adoptopenjdk/openjdk11:alpine-slim
#FROM adoptopenjdk/openjdk11:alpine-jre

FROM openjdk:11
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","-Dserver.port=9090","/app.jar"]