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

### nodejs, npm
cd $HOME
tar -C /usr/local --strip-components 1 -xJf node-v4.5.0-linux-x64.tar.xz

### hyperflow
cd /
npm install https://github.com/hopped/hyperflow/archive/develop.tar.gz
npm install https://github.com/dice-cyfronet/hyperflow-monitoring-plugin/archive/master.tar.gz

### hyperflow-ui
mkdir /hyperflow-ui
cd $HOME && tar zxv --no-same-owner --no-same-permissions -f hyperflow-ui.tar.gz -C /hyperflow-ui

### influxdb, grafana
sudo apt-get update
sudo apt-get install -y influxdb grafana
