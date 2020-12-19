#!/bin/bash

docker stop elasticsearch
docker stop logstash
docker stop kibana

docker rm elasticsearch
docker rm logstash
docker rm kibana