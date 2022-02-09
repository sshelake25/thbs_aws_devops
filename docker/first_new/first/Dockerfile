#base image for our image - 
FROM openjdk:8-jdk-alpine
# run container out of this build - 
# ARG JAR_FILE=target/*.jar

COPY target/*.jar app.jar

#start running you sb app when container will get started 
ENTRYPOINT ["java","-jar","/app.jar"]

# docker build -t sshelake25/thbs_aws_dev:first-spring-app