FROM centos:7

ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0
ENV KIBANA_HOME=/opt/kibana

RUN yum -y install java-1.8.0-openjdk

RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
COPY container-files/kibana.repo /etc/yum.repos.d/

RUN yum -y install kibana
RUN yum -y clean all

# Config mount
VOLUME ["${KIBANA_HOME}/config-entry"]

COPY container-files/entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh

USER kibana

ENV KIBANA_HOME=${KIBANA_HOME}
ENV PATH=${PATH}:${JAVA_HOME}/bin
ENV PATH=${PATH}:${KIBANA_HOME}/bin

# Expose ports.
EXPOSE 5601

ENTRYPOINT ["/opt/entrypoint.sh"]
