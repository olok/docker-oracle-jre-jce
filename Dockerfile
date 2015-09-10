FROM olok/oracle-jre

RUN apt-get update && apt-get install -y unzip

RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" -O /opt/jre/jce.zip http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip &&\
    unzip -d /opt/jre/lib/security -o -j /opt/jre/jce.zip &&\
    rm /opt/jre/jce.zip
