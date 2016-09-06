#!/bin/sh

docker run --rm --name kibana -t -i -p 5601:5601 centos7/kibana
