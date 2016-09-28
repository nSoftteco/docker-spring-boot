FROM java:8

RUN apt-get update
RUN apt-get install -y maven

WORKDIR /code

ADD pom.xml /code/pom.xml

ADD src /code/src
RUN ["mvn", "package"]

VOLUME /tmp

EXPOSE 8080

#CMD ["java","-jar","target/spring-boot-docker-0.0.1.jar"]
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","target/spring-boot-docker-0.0.1.jar"]