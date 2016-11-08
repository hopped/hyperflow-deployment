#!/bin/bash
echo "START:configure.sh"

# influxdb
sudo service influxdb start
while ! echo exit | nc localhost 8086; do sleep 1; done
influx -execute 'CREATE DATABASE hyperflow'

# grafana
sed -i '/auth.anonymous/{n;n;s/false/true/}' /etc/grafana/grafana.ini
sed -i '/auth.anonymous/{n;n;s/;//}' /etc/grafana/grafana.ini
sed -i 's/;data/data/g' /etc/grafana/grafana.ini
sed -i 's/;logs/logs/g' /etc/grafana/grafana.ini
cp conf/hyperflow-home.json /usr/share/grafana/public/dashboards/home.json
sudo service grafana-server start
while ! echo exit | nc localhost 3000; do sleep 1; done
curl -XPOST http://admin:admin@localhost:3000/api/datasources -H "Content-Type: application/json;charset=UTF-8" -d '{ "name": "hyperflow", "type": "influxdb", "access": "proxy", "url": "http://localhost:8086", "password": "root", "user": "root", "database": "hyperflow", "basicAuth": false, "basicAuthUser": "", "basicAuthPassword": "", "withCredentials": false, "isDefault": true }'

echo "END:configure.sh"