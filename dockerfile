# Download base image ubuntu 18.04 (bionic)
FROM ubuntu:bionic

MAINTAINER Gyorgy Molnar, Balazs Molnar

# Copy SSH key for git private repos
ADD key /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

# Skip Host verification for github
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

# Skip Host verification for gitLab
RUN echo "Host gitlab.channel4.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

# Install git
RUN apt-get update && \
apt-get install -y git

# Prepare installation of Oracle Java 8
ENV JAVA_VER 8
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

# Install Java 8
RUN apt-get install -y openjdk-8-jre-headless

#Install Maven
RUN apt-get install -y maven

# Install Maven 3.3.9
# RUN wget -O /tmp/apache-maven-3.3.9-bin.tar.gz http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
# tar xzf /tmp/apache-maven-3.3.9-bin.tar.gz -C /opt/ && \
# ln -s /opt/apache-maven-3.3.9 /opt/maven && \
# ln -s /opt/maven/bin/mvn /usr/local/bin && \
# rm -f /tmp/apache-maven-3.3.9-bin.tar.gz

# ENV MAVEN_HOME /opt/maven

#  git repository
RUN git clone git@gitlab.channel4.com:bigscreen/ConnectedTVApplication.git && \
cd ConnectedTVApplication && \
mvn package

EXPOSE 80 443
