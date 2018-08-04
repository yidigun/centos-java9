FROM centos:latest
MAINTAINER dklee@yidigun.com

ENV JAVA_VERSION_MAJOR 9
ENV JAVA_VERSION_MINOR 4
ENV JAVA_VERSION_BUILD 11

COPY serverjre-9.0.4_linux-x64_bin.tar.gz /tmp
RUN yum -y install libX11 libXext libXi libXrender libXtst alsa-lib && \
    mkdir /opt/oracle && \
    tar zxf /tmp/serverjre-9.0.4_linux-x64_bin.tar.gz -C /opt/oracle && \
    rm -f /tmp/serverjre-9.0.4_linux-x64_bin.tar.gz && \
    ln -s jdk-${JAVA_VERSION_MAJOR}.0.${JAVA_VERSION_MINOR} /opt/oracle/java

ENV JAVA_HOME /opt/oracle/java
ENV PATH ${PATH}:${JAVA_HOME}/bin
