FROM debian:jessie

RUN apt-get update && apt-get install -y wget unzip

RUN mkdir /opt/jre &&\
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" -O /opt/jre/jre.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jre-8u60-linux-x64.tar.gz &&\
    tar xpfo /opt/jre/jre.tar.gz -C /opt/jre --strip 1 &&\
    rm /opt/jre/jre.tar.gz

RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" -O /opt/jre/jce.zip http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip &&\
    unzip -d /opt/jre/lib/security -j /opt/jre/jce.zip &&\
    rm /opt/jre/jce.zip

ENV JAVA_HOME /opt/jre
ENV PATH $PATH:/opt/jre/bin
