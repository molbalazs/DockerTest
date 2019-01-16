# Download base image ubuntu 18.04 (bionic)
FROM ubuntu:bionic

# Install git
RUN apt-get update && \
apt-get install -y git wget
#gnupg software-properties-common wget

# Copy SSH key for git private repos
ADD key /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

# Skip Host verification for git
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

# Prepare installation of Oracle Java 8
ENV JAVA_VER 8
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Download Java
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3a%2F%2Fwww.oracle.com%2Ftechnetwork%2Fjava%2Fjavase%2Fdownloads%2Fjdk8-downloads-2133151.html; oraclelicense=accept-securebackup-cookie;" "https://download.oracle.com/otn-pub/java/jdk/8u202-b08/1961070e4c9b4e26a04e7f5a083f551e/jre-8u202-linux-x64.tar.gz" && \
mkdir /usr/lib/jvm && \
cd /usr/lib/jvm && \
tar -xvzf /jre-8u202-linux-x64.tar.gz && \
rm /jre-8u202-linux-x64.tar.gz


# Install git, wget, Oracle Java8
# RUN add-apt-repository -y ppa:webupd8team/java
# echo 'deb http://ppa.launchpad.net/webupd8team/java/ubuntu bionic main' >> /etc/apt/sources.list && \

# echo oracle-java${JAVA_VER}-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
# apt-get install -y --force-yes --no-install-recommends oracle-java${JAVA_VER}-installer oracle-java${JAVA_VER}-set-default && \
# apt-get clean && \
# rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
# rm -rf /var/cache/oracle-jdk${JAVA_VER}-installer

# Set Oracle Java as the default Java
# RUN update-java-alternatives -s java-8-oracle
# RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.bashrc

# Install maven 3.3.9
# RUN wget --no-verbose -O /tmp/apache-maven-3.3.9-bin.tar.gz http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
# tar xzf /tmp/apache-maven-3.3.9-bin.tar.gz -C /opt/ && \
# ln -s /opt/apache-maven-3.3.9 /opt/maven && \
# ln -s /opt/maven/bin/mvn /usr/local/bin && \
# rm -f /tmp/apache-maven-3.3.9-bin.tar.gz

# ENV MAVEN_HOME /opt/maven

# EXPOSE 80 443