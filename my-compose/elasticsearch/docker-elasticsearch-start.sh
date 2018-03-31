#!/bin/sh

CURRENT_PATH=$(cd $(dirname $0) && pwd)
HOST_CONFIG_PATH=${CURRENT_PATH}/config
HOST_DATA_PATH=${CURRENT_PATH}/data
HOST_LOG_PATH=${CURRENT_PATH}/log

docker run --rm --name elasticsearch -t -i \
     -v ${HOST_CONFIG_PATH}:/opt/elasticsearch/config -v ${HOST_DATA_PATH}:/opt/elasticsearch/data -v ${HOST_LOG_PATH}:/opt/elasticsearch/logs \
     -p 9200:9200 -p 9300:9300 \
     centos7/elasticsearch
