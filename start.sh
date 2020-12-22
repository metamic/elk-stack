#!/bin/bash

source $PWD/.env

if [ -z "$ELASTICSEARCH_PASSWORD" ]; then
    echo 'Please input your elastic password like "export ELASTICSEARCH_PASSWORD=<PASSWORD>"'
    exit 1
fi

if [ ! -d "$PWD/elasticsearch" ]; then
    cp -r $PWD/elasticsearch/conf/elasticsearch $PWD/
fi

if [ ! -d "$PWD/kibana" ]; then
    cp -r $PWD/kibana/conf/kibana $PWD/
fi

if [ ! -d "$PWD/logstash" ]; then
    cp -r $PWD/logstash/conf/logstash $PWD/
fi

sed -i "s/\$ELASTIC_VERSION/$ELASTIC_VERSION/g" $PWD/elasticsearch/docker-compose.yml

sed -i "s#\$ELASTICSEARCH_HOST#$ELASTICSEARCH_HOST#g" $PWD/kibana/config/kibana.yml
sed -i "s/\$ELASTICSEARCH_PASSWORD/$ELASTICSEARCH_PASSWORD/g" $PWD/kibana/config/kibana.yml
sed -i "s/\$KIBANA_VERSION/$KIBANA_VERSION/g" $PWD/kibana/docker-compose.yml

sed -i "s#\$ELASTICSEARCH_HOST#$ELASTICSEARCH_HOST#g" $PWD/logstash/config/logstash.yml
sed -i "s/\$ELASTICSEARCH_PASSWORD/$ELASTICSEARCH_PASSWORD/g" $PWD/logstash/config/logstash.yml
sed -i "s#\$OUTPUT_ELASTICSEARCH_HOST#$OUTPUT_ELASTICSEARCH_HOST#g" $PWD/logstash/pipeline/logstash.conf
sed -i "s/\$ELASTICSEARCH_PASSWORD/$ELASTICSEARCH_PASSWORD/g" $PWD/logstash/pipeline/logstash.conf
sed -i "s/\$LOGSTASH_VERSION/$LOGSTASH_VERSION/g" $PWD/logstash/docker-compose.yml

# docker-compose up --build --detach