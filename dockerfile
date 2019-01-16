# Download base image ubuntu 18.04 (bionic)
FROM ubuntu:bionic

MAINTAINER Gyorgy Molnar, Balazs Molnar

# Install git
RUN apt-get update && \
apt-get install -y git wget

# Copy SSH key for git private repos
ADD key /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

# Skip Host verification for github
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

# Prepare installation of Oracle Java 8
ENV JAVA_VER 8
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

# Install Java 8
RUN apt-get install -y openjdk-8-jdk

# Install maven 3.3.9
RUN wget --no-verbose -O /tmp/apache-maven-3.3.9-bin.tar.gz http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
tar xzf /tmp/apache-maven-3.3.9-bin.tar.gz -C /opt/ && \
ln -s /opt/apache-maven-3.3.9 /opt/maven && \
ln -s /opt/maven/bin/mvn /usr/local/bin && \
rm -f /tmp/apache-maven-3.3.9-bin.tar.gz

ENV MAVEN_HOME /opt/maven

EXPOSE 80 443
