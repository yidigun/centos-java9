FROM centos:latest
MAINTAINER dklee@yidigun.com

ENV JAVA_VERSION_MAJOR 9
ENV JAVA_VERSION_MINOR 4
ENV JAVA_VERSION_BUILD 11

RUN yum -y install libX11 libXext libXi libXrender libXtst alsa-lib && \
    mkdir /opt/oracle && \
    curl -jksSL http://iuinna.yidigun.com/java-archived-tmp/serverjre-${JAVA_VERSION_MAJOR}.0.${JAVA_VERSION_MINOR}_linux-x64_bin.tar.gz | \
    tar zxf - -C /opt/oracle && \
    ln -s jdk-${JAVA_VERSION_MAJOR}.0.${JAVA_VERSION_MINOR} /opt/oracle/java && \
    yum -y clean all

ENV JAVA_HOME /opt/oracle/java
ENV PATH ${PATH}:${JAVA_HOME}/bin
