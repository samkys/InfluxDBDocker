FROM ubuntu:bionic

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN  apt-get update \
  && apt-get install -y sudo

RUN echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections \
    && sudo apt-get install -y -q

# Make sure systemd is installed
RUN sudo apt-get install -y systemd

# Now install Influxdb, Grafana, and Telegraf
ADD influxdb-install.sh /influxdb-install.sh
RUN ["/bin/bash", "/influxdb-install.sh"]

# Add influx startup script
ADD influxdb /etc/init.d/influxdb
RUN sudo chmod +x /etc/init.d/influxdb

# Add the Grafana configuration file
ADD GrafanaDashboard.json /etc/grafana/GrafanaDashboard.json
ADD grafana.ini /etc/grafana/grafana.ini

# Entry point
ADD entrypoint.sh /entry.sh
RUN sudo service influxdb start
ENTRYPOINT ["/bin/bash","/entry.sh"]

#CMD tail -f /dev/null
#CMD /opt/influxdb/run