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

### grafana
sed -i '/auth.anonymous/{n;n;s/false/true/}' /etc/grafana/grafana.ini
