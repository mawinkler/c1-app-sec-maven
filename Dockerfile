#
# Build stage
#
FROM maven:3.8-openjdk-15-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM openjdk:15-slim
COPY --from=build /home/app/target/demo-0.0.1-SNAPSHOT.jar /usr/local/lib/demo.jar
COPY --from=build /root/.m2/repository/com/trend/app_protect/trend_app_protect/4.4.6/trend_app_protect-4.4.6.jar /usr/local/lib/trend_app_protect.jar

EXPOSE 8080
ENTRYPOINT ["java","-javaagent:/usr/local/lib/trend_app_protect.jar","-jar","/usr/local/lib/demo.jar"]
