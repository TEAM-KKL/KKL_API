FROM eclipse-temurin:21-jdk-alpine as build
WORKDIR /app

COPY gradle gradle
COPY build.gradle settings.gradle gradlew ./
COPY src src

RUN chmod +x ./gradlew
RUN ./gradlew bootJar -x test
RUN ls -la build/libs/

FROM eclipse-temurin:21-jre-alpine
VOLUME /tmp
COPY --from=build /app/build/libs/*.jar app.jar
ENV SPRING_PROFILES_ACTIVE=prod
ENTRYPOINT ["java","-jar","/app.jar"] 