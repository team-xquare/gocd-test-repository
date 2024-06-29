FROM openjdk:17
ENV TZ=Asia/Seoul

RUN ./gradlew build -x test

COPY build/libs/gocd-test-repository-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]
