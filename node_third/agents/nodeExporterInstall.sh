#!/bin/bash
##########################################################################################################
#  Objective:
#			This script install node_exporter as a service, also install the text collertor.
##########################################################################################################
NODEHOME=/opt/prometheus/
TEXT_COLLECTOR=$NODEHOME/node_exporter/textfile_collector
wget https://github.com/prometheus/node_exporter/releases/download/v0.16.0/node_exporter-0.16.0.linux-amd64.tar.gz
mkdir ./node_exporter
sudo useradd --no-create-home --shell /bin/false prometheus
sudo mkdir -p $NODEHOME
tar  -xzf node_exporter-* -C ./node_exporter --strip-components=1
sudo mv node_exporter $NODEHOME/
# Install node exporter service
sudo cp nodeexporterd /etc/init.d/
sudo chmod +x /etc/init.d/nodeexporterd
sudo update-rc.d nodeexporterd defaults
rm -rf node_exporter*
### Text Collector: to scrap metrics from sources as batch process
mkdir -p $TEXT_COLLECTOR
sudo service nodeexporterd start
############################### Notes #################################################
#Manual node exporter start:
#node_exporter --web.listen-address="$aws_ip:9100" --web.telemetry-path="/node_metrics"
#
#Metric publicated in text collector:
#echo 'metadata{role="test_metric",datacenter="AWS"} 1' | sudo tee $TEXT_COLLECTOR/metadata.prom
