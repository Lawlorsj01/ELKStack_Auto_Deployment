# ELKStack_Auto_Deployment

ELK Stack Version 8.7.0
This repo is intended for rapid deployment and configuration of simple ELK Stack Services. Currently included is Elasticsearch and Kibana.


INSTRUCTIONS FOR UBUNTU

1) Download this entire repo and leave it all in the same folder.
2) Run Download_The_ELK_Stack.sh
3) Change all of the localhost in elasticsearch.yml and kibana.yml with your host IP
4) Run Auto_Deploy_ELK.sh
5) The ELK Stack should now be deployed


INSTRUCTIONS FOR ALL OTHER LINUX PLATFORMS

1) Download Elasticsearch and Kibana from https://www.elastic.co/downloads/elasticsearch 
2) Install both Elasticsearch and Kibana depending on the system. Ex: Ubuntu use dpkg -i, openSUSE use zypper, etc.
3) Copy all files from this repo to /ELK_Files (Can be anywhere as long as its called ELK_Files and contains all files from this repo)
4) Change all of the localhost in elasticsearch.yml and kibana.yml with your host IP
4) Run Auto_Deploy_ELK.sh
5) The ELK Stack should now be deployed
