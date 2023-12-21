FROM adoptopenjdk/openjdk8:alpine-slim
WORKDIR /tmp
RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
RUN tar -xvzf apache-maven-3.9.6-bin.tar.gz
ENV MAVEN_HOME=/tmp/apache-maven-3.9.6/
ENV PATH=/tmp/apache-maven-3.9.6/bin/:$PATH
WORKDIR /app
COPY . .
RUN mvn clean package
ENTRYPOINT ["java", "-jar", "/app/target/numeric-0.0.1.jar"]

