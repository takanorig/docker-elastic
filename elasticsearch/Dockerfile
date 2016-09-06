FROM centos:7

ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0
ENV ELASTICSEARCH_HOME=/usr/share/elasticsearch
ENV ELASTICSEARCH_CONF_PATH=/etc/elasticsearch

RUN yum -y install java-1.8.0-openjdk

RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
ADD elasticsearch.repo /etc/yum.repos.d/

RUN yum -y install elasticsearch
RUN yum -y clean all
ADD config/elasticsearch.yml ${ELASTICSEARCH_CONF_PATH}/

RUN ${ELASTICSEARCH_HOME}/bin/plugin install mobz/elasticsearch-head

RUN mkdir -p /opt/elasticsearch/data; chown -R elasticsearch:elasticsearch /opt/elasticsearch/data
RUN mkdir -p /opt/elasticsearch/logs; chown -R elasticsearch:elasticsearch /opt/elasticsearch/logs
VOLUME ["/opt/elasticsearch/data", "/opt/elasticsearch/logs"]

USER elasticsearch

ENV PATH=${PATH}:${JAVA_HOME}/bin
ENV PATH=${PATH}:${ELASTICSEARCH_HOME}/bin

# Confirm
RUN echo "##### Confirm" && \
      echo "----- Java -----" && \ 
      ${JAVA_HOME}/bin/java -version && \
      echo "----- Elasticsearch config -----" && \ 
      cat ${ELASTICSEARCH_CONF_PATH}/elasticsearch.yml && \
    echo "#####"

CMD elasticsearch -Des.default.path.conf=${ELASTICSEARCH_CONF_PATH}

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
