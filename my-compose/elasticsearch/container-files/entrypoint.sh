#!/bin/sh

ELASTICSEARCH_CONF_PATH=/opt/elasticsearch/config

if [ ! -e "${ELASTICSEARCH_CONF_PATH}" ]; then
    # Default path
    ELASTICSEARCH_CONF_PATH=/usr/share/elasticsearch/config
fi

# Confirm
echo "##### Confirm"
echo "----- Java -----"
${JAVA_HOME}/bin/java -version
echo "----- Elasticsearch config -----"
echo "ELASTICSEARCH_CONF_PATH="${ELASTICSEARCH_CONF_PATH}
cat ${ELASTICSEARCH_CONF_PATH}/elasticsearch.yml
echo "#####"

# Run
echo ""
echo "##### Start Elasticsearch"
elasticsearch -Des.default.path.conf=${ELASTICSEARCH_CONF_PATH}
