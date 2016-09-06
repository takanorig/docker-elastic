#!/bin/sh

docker run --rm --name elasticsearch -t -i -p 9200:9200 -p 9300:9300 -v data:/opt/elasticsearch-data -v logs:/opt/elasticsearch-logs centos7/elasticsearch
