FROM centos:7

ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0
ENV KIBANA_HOME=/opt/kibana

RUN yum -y install java-1.8.0-openjdk

RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
ADD kibana.repo /etc/yum.repos.d/

RUN yum -y install kibana
RUN yum -y clean all
ADD config/kibana.yml ${KIBANA_HOME}/config/

USER kibana

ENV PATH=${PATH}:${JAVA_HOME}/bin
ENV PATH=${PATH}:${KIBANA_HOME}/bin

# Confirm
RUN echo "##### Confirm" && \
      echo "----- Java -----" && \ 
      ${JAVA_HOME}/bin/java -version && \
      echo "----- Kibana config -----" && \ 
      cat ${KIBANA_HOME}/config/kibana.yml && \
    echo "#####"

CMD kibana -c ${KIBANA_HOME}/config/kibana.yml

# Expose ports.
EXPOSE 5601
