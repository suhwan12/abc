FROM maven:3-openjdk-8 AS mbuilder
COPY . /usr/src/hello/
WORKDIR /usr/src/hello
RUN mvn package

FROM tomcat:8-jre8
COPY --from=mbuilder /var/jenkins_home/workspace/pipeline_with_docker/target/hello-world.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080/tcp
