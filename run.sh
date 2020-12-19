#!/bin/bash

source $PWD/.env

sed -i "s/\$ELASTICSEARCH_PASSWORD/$ELASTICSEARCH_PASSWORD/g" $PWD/kibana/config/kibana.yml
sed -i "s/\$ELASTICSEARCH_PASSWORD/$ELASTICSEARCH_PASSWORD/g" $PWD/logstash/config/logstash.yml

docker-compose up --build --detach