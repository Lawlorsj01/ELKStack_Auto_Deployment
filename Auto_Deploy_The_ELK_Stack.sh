#!/bin/bash

sudo rm /etc/elasticsearch/elasticsearch.yml

sudo rm /etc/kibana/kibana.yml

sudo cp ./elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

sudo cp ./kibana.yml /etc/kibana/kibana.yml

sudo mkdir /etc/kibana/certs
sudo cp /etc/elasticsearch/certs/http_ca.crt /etc/kibana/certs/http_ca.crt

sudo /usr/share/elasticsearch/bin/elasticsearch-setup-passwords interactive

sudo chown -R /usr/share/elasticsearch/

sudo chown -R /etc/elasticsearch

sudo systemctl restart elasticsearch.service

sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password -b -u elastic -interactive <<EOF
changeme
changeme
EOF

sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password -b -u kibana_system -interactive <<EOF
changeme
changeme
EOF

sudo systemctl restart kibana.service

echo "Kibana is now ready. Log in with elastic:changeme"
