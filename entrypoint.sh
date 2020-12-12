#!/bin/bash

# Run Influxdb
#sudo service influxdb start 

# Launch Grafana
/etc/init.d/grafana-server start
tail -f /dev/null