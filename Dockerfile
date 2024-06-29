FROM gradle:7.3.3-jdk17 AS build
WORKDIR /app

COPY . .

RUN gradle build -x test

FROM openjdk:17-jdk-slim

ENV TZ=Asia/Seoul

COPY --from=build /app/build/libs/*.jar app.jar

# 애플리케이션 실행
ENTRYPOINT ["java", "-jar", "/app.jar"]
