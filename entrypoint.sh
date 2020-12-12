#!/bin/bash

# Run Influxdb
sudo chmod +x /etc/init.d/influxd
sudo service influxdb start 

# Launch Grafana
/etc/init.d/grafana-server start
tail -f /dev/null