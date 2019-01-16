# Download base image ubuntu 18.04 (bionic)
FROM ubuntu:bionic

MAINTAINER Gyorgy Molnar, Balazs Molnar

# Copy SSH key for git private repos
ADD key /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

# Skip Host verification for gitLab
RUN echo "Host gitlab.channel4.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

# Prepare installation of Java 8
ENV JAVA_VER 8
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

# Installation of git, Java 8 and Maven
RUN apt-get update && apt-get install -y \
git \
openjdk-8-jre-headless \
maven

# Copy app
ADD app.sh /app/app.sh
# Run the app on container run
CMD ["bash", "/app/app.sh"]
