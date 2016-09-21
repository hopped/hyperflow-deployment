#!/bin/bash
echo amqp://$PUBLIC_RabbitMQ_Required_by_Master > $HOME/AMQP_URL
echo redis://$PUBLIC_Redis_Required_by_Master > $HOME/REDIS_URL

cp /hyperflow-deployment/cookbooks/workflows/templates/default/hyperflowMonitoringPlugin.config.js.erb /node_modules/hyperflow-monitoring-plugin/hyperflowMonitoringPlugin.config.js

export AMQP_URL=$(cat $HOME/AMQP_URL)
export METRIC_COLLECTOR=http://localhost:8086/write?db=hyperflow
export METRIC_COLLECTOR_TYPE=influxdb
