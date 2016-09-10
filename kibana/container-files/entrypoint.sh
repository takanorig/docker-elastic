#!/bin/sh

KIBANA_CONF=${KIBANA_HOME}/config-entry/kibana.yml

if [ ! -e "${KIBANA_CONF}" ]; then
    # Default path
    KIBANA_CONF=/opt/kibana/config/kibana.yml
fi

# Confirm
echo "##### Confirm"
echo "----- Java -----"
${JAVA_HOME}/bin/java -version
echo "----- Kibana config -----"
echo "KIBANA_CONF="${KIBANA_CONF}
cat ${KIBANA_CONF}
echo "#####"

# Run
echo ""
echo "##### Start Kibana"
kibana -c ${KIBANA_CONF}
