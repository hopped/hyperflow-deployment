#!/bin/bash
echo amqp://$PUBLIC_RabbitMQ_Required_by_Master > $HOME/AMQP_URL
echo redis://$PUBLIC_Redis_Required_by_Master > $HOME/REDIS_URL

### monitoring plugin for hyperflow
export METRIC_COLLECTOR=http://localhost:8086/write?db=hyperflow
export METRIC_COLLECTOR_TYPE=influxdb
export AMQP_URL=$(cat $HOME/AMQP_URL)
export RABBITMQ_USER=guest
export RABBITMQ_PASSWORD=guest
export SERVER_NAME=HyperFlow
cat conf/hyperflowMonitoringPlugin.config.js | envsubst > /node_modules/hyperflow-monitoring-plugin/hyperflowMonitoringPlugin.config.js

# influxdb
sudo service influxdb start
influx -execute 'CREATE DATABASE hyperflow'

# grafana
sed -i '/auth.anonymous/{n;n;s/false/true/}' /etc/grafana/grafana.ini
mv conf/hyperflow-home.json /usr/share/grafana/public/dashboards/home.json
sudo service grafana-server start
curl -XPOST http://admin:admin@localhost:3000/api/datasources -H "Content-Type: application/json;charset=UTF-8" -d '{ "name": "hyperflow", "type": "influxdb", "access": "proxy", "url": "http://localhost:8086", "password": "root", "user": "root", "database": "hyperflow", "basicAuth": false, "basicAuthUser": "", "basicAuthPassword": "", "withCredentials": false, "isDefault": true }'
