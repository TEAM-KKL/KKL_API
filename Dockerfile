FROM eclipse-temurin:21-jdk-alpine as build
WORKDIR /app

COPY gradle gradle
COPY build.gradle settings.gradle gradlew ./
COPY src src

RUN chmod +x ./gradlew
RUN ./gradlew build -x test
RUN ls -la build/libs/
RUN mkdir -p build/dependency
RUN cd build/dependency && jar -xf ../libs/*.jar

FROM eclipse-temurin:21-jre-alpine
VOLUME /tmp
ARG DEPENDENCY=/app/build/dependency
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com.example.KKL_API.KKL_APIApplication"] 