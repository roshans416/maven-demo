FROM maven:3.6.0-jdk-8-alpine as builder
COPY  . /root/app/
WORKDIR /root/app
RUN mvn clean package
FROM tomcat:8.0-alpine
COPY --from=builder /root/app/target /usr/local/tomcat/webapps
EXPOSE 8080
CMD [“catalina.sh”, “run”]
