
FROM eclipse-temurin:23-jdk

WORKDIR /app

COPY target/SkillSwap-1.0-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
