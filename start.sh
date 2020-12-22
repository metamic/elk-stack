#!/bin/bash

source $PWD/.env

if [ -z "$ELASTICSEARCH_PASSWORD" ]; then
    echo 'Please input your elastic password like "export ELASTICSEARCH_PASSWORD=<PASSWORD>"'
    exit 1
fi

if [ ! -d "$PWD/elasticsearch" ]; then
    cp -r $PWD/conf/elasticsearch/conf/elasticsearch $PWD/elasticsearch
    rm $PWD/elasticsearch/docker-compose.yml
fi

if [ ! -d "$PWD/kibana" ]; then
    cp -r $PWD/conf/kibana/conf/kibana $PWD/kibana
    rm $PWD/kibana/docker-compose.yml
fi

if [ ! -d "$PWD/logstash" ]; then
    cp -r $PWD/conf/logstash/conf/logstash $PWD/logstash
    rm $PWD/logstash/docker-compose.yml
fi


sed -i "s#\$ELASTICSEARCH_HOST#$ELASTICSEARCH_HOST#g" $PWD/kibana/config/kibana.yml
sed -i "s/\$ELASTICSEARCH_PASSWORD/$ELASTICSEARCH_PASSWORD/g" $PWD/kibana/config/kibana.yml

sed -i "s#\$ELASTICSEARCH_HOST#$ELASTICSEARCH_HOST#g" $PWD/logstash/config/logstash.yml
sed -i "s/\$ELASTICSEARCH_PASSWORD/$ELASTICSEARCH_PASSWORD/g" $PWD/logstash/config/logstash.yml

find $PWD/logstash/pipeline -type f -exec sed -i -e "s#\$OUTPUT_ELASTICSEARCH_HOST#$OUTPUT_ELASTICSEARCH_HOST#g" {} \;
find $PWD/logstash/pipeline -type f -exec sed -i -e "s#\$ELASTICSEARCH_PASSWORD#$ELASTICSEARCH_PASSWORD#g" {} \;

docker-compose up --build -d