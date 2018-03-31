#!/bin/sh

HOST_CONFIG_PATH=$(cd $(dirname $0) && pwd)/config

docker run --rm --name kibana -t -i \
    -v ${HOST_CONFIG_PATH}:/opt/kibana/config-entry \
    -p 5601:5601 \
    centos7/kibana
