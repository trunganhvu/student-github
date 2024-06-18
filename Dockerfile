FROM openjdk:17.0.2-slim as build

WORKDIR /app

COPY . .

RUN ./gradlew bootJar

FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

VOLUME /tmp

COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
