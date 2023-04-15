#!/bin/bash

wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.7.0-amd64.deb

wget https://artifacts.elastic.co/downloads/kibana/kibana-8.7.0-amd64.deb

sudo dpkg -i elasticsearch-8.7.0-amd64.deb

sudo dpkg -i kibana-8.7.0-amd64.deb

rm elasticsearch-8.7.0-amd64.deb

rm kibana-8.7.0-amd64.deb

wget https://raw.githubusercontent.com/Lawlorsj01/ELKStack_Auto_Deployment/main/elasticsearch.yml

wget https://raw.githubusercontent.com/Lawlorsj01/ELKStack_Auto_Deployment/main/kibana.yml

./Auto_Deploy_The_ELK_Stack.sh
