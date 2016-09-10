FROM centos:7

ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0
ENV ELASTICSEARCH_HOME=/usr/share/elasticsearch

RUN yum -y install java-1.8.0-openjdk

RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
COPY container-files/elasticsearch.repo /etc/yum.repos.d/

RUN yum -y install elasticsearch
RUN yum -y clean all

RUN ${ELASTICSEARCH_HOME}/bin/plugin install mobz/elasticsearch-head

# Config mount
VOLUME ["/opt/elasticsearch/config"]

COPY container-files/entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh

# Output mount
RUN mkdir -p /opt/elasticsearch/data; chown -R elasticsearch:elasticsearch /opt/elasticsearch/data
RUN mkdir -p /opt/elasticsearch/logs; chown -R elasticsearch:elasticsearch /opt/elasticsearch/logs
VOLUME ["/opt/elasticsearch/data", "/opt/elasticsearch/logs"]

USER elasticsearch

ENV ELASTICSEARCH_HOME=${ELASTICSEARCH_HOME}
ENV PATH=${PATH}:${JAVA_HOME}/bin
ENV PATH=${PATH}:${ELASTICSEARCH_HOME}/bin

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300

ENTRYPOINT ["/opt/entrypoint.sh"]
