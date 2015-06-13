# docker-elasticsearch-cn-out-of-box
# docker pull hangxin1940/docker-elasticsearch-cn-out-of-box
FROM java:openjdk-7-jre
MAINTAINER hangxin1940 <hangxin1940@gmail.com>

RUN wget http://github.com/hangxin1940/elasticsearch-cn-out-of-box/archive/v1.6.0.zip && unzip v1.6.0.zip && \
    mv /elasticsearch-cn-out-of-box-1.6.0 /elasticsearch && \
    rm /elasticsearch/lib/sigar/*freebsd* && \
    rm /elasticsearch/lib/sigar/*macosx* && \
    rm /elasticsearch/lib/sigar/*solaris* && \
    rm /elasticsearch/lib/sigar/*winnt* && \
    rm /elasticsearch/bin/*.exe && \
    rm /elasticsearch/bin/service && \
    rm v1.6.0.zip

RUN mkdir /data /logs

VOLUME ["/data", "/logs"]

ENV ES_HOME /elasticsearch

ADD docker-start /elasticsearch/bin/docker-start

EXPOSE 9200 9300
CMD ["/elasticsearch/bin/docker-start"]
