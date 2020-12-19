#!/bin/bash

source $PWD/.env

if [ ! -d "$PWD/elasticsearch" ]; then
    cp -r $PWD/conf/elasticsearch $PWD/
fi

if [ ! -d "$PWD/kibana" ]; then
    cp -r $PWD/conf/kibana $PWD/
fi

if [ ! -d "$PWD/logstash" ]; then
    cp -r $PWD/conf/logstash $PWD/
fi

sed -i "s/\$ELASTICSEARCH_PASSWORD/$ELASTICSEARCH_PASSWORD/g" $PWD/kibana/config/kibana.yml
sed -i "s/\$ELASTICSEARCH_PASSWORD/$ELASTICSEARCH_PASSWORD/g" $PWD/logstash/config/logstash.yml

docker-compose up --build --detach