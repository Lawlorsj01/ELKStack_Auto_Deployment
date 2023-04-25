#!/bin/bash

echo "Removing Default configs..."
sudo rm /etc/elasticsearch/elasticsearch.yml
sudo rm /etc/kibana/kibana.yml

#Find Primary Interface using successfull query to 8.8.8.8
interface_name=$(ip route get 8.8.8.8 | awk -- '{printf $5}')
echo "Elk Stack using interface $interface_name"
host_ip=$(ip addr show $interface_name | grep -oP 'inet \K[\d.]+')
echo "ELK Stack to be configured on IP $host_ip"

echo "Backing up and writing ELK Configs..."
sed -i.bak "s|localhost|$host_ip|g" elasticsearch.yml
sed -i.bak "s|localhost|$host_ip|g" kibana.yml

echo "Moving generated configs to default install location"
sudo cp ./elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
sudo cp ./kibana.yml /etc/kibana/kibana.yml

echo "Copying Certs"
sudo mkdir /etc/kibana/certs
sudo cp /etc/elasticsearch/certs/http_ca.crt /etc/kibana/certs/http_ca.crt

echo "Changing Ownership"
sudo chown -R /usr/share/elasticsearch/
sudo chown -R /etc/elasticsearch
sudo systemctl restart elasticsearch.service

echo "Setting Default Password"
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
