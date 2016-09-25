FROM xmlangel/oracle-jdk:8u102

MAINTAINER Kwangmyung Kim <kwangmyung.kim@gmail.com>

ENV JMETER_VERSION 2.13

# Get jmeter
RUN wget --quiet --no-cookies https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz -O /tmp/jmeter.tgz  \
&& tar xzvf /tmp/jmeter.tgz -C /opt  \
&& mv /opt/apache-jmeter-${JMETER_VERSION} /opt/jmeter \
&& rm /tmp/jmeter.tgz
RUN sed -i 's/-Xms512m -Xmx512m/-Xms512m -Xmx1024m/g' /opt/jmeter/bin/jmeter
RUN mkdir /opt/jmeter/testcase

#Add plugin
ADD JMeterPlugins-Standard.jar /opt/jmeter/lib/ext

VOLUME "/opt/jmeter/bin/testcase"

WORKDIR /opt/jmeter/bin
