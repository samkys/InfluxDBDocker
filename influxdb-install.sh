#!/bin/bash

# Influxdb install
wget https://dl.influxdata.com/influxdb/releases/influxdb_1.8.3_amd64.deb
sudo dpkg -i influxdb_1.8.3_amd64.deb

# Telegraf install
wget https://dl.influxdata.com/telegraf/releases/telegraf_1.15.3-1_amd64.deb
sudo dpkg -i telegraf_1.15.3-1_amd64.deb

# Grafana install
sudo apt-get install -y apt-transport-https
sudo apt-get install -y software-properties-common wget
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/enterprise/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt-get install -y grafana-enterprise