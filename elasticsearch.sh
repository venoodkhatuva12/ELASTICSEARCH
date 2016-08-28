#/bin/bash
#!/bin/bash
#Script made for Elasticsearch installtion
#Author: Vinod.N K
#Usage: ElasticSerach 
#Distro : Linux -Centos, Rhel, and any fedora
#Check whether root user is running the script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

export ES_PKG_NAME=elasticsearch-1.4.1
export ES_EC2_CLOUD_PLUGIN_VERSION=2.4.1

if [ "$(id -u)" != "0" ]; then
  echo "Please run this script with sudo"
  exit 1
fi

yum update -y

# Download the rpm
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.noarch.rpm

# Install the rpm
rpm -i $ES_PKG_NAME.noarch.rpm
rm $ES_PKG_NAME.noarch.rpm

# Install plugins:
cd /usr/share/elasticsearch
bin/plugin -install elasticsearch/elasticsearch-cloud-aws/$ES_EC2_CLOUD_PLUGIN_VERSION
bin/plugin -install mobz/elasticsearch-head
bin/plugin -install lukas-vlcek/bigdesk
bin/plugin -install royrusso/elasticsearch-HQ
bin/plugin -install lmenezes/elasticsearch-kopf
# bin/plugin -install elasticsearch/marvel/latest

echo 'Elasticsearch Installation complete...'
