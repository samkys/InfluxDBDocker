#!/bin/bash

# Run Influxdb
sudo systemctl start influxdb 

# Launch Grafana
/etc/init.d/grafana-server start
tail -f /dev/null