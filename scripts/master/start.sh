#!/bin/bash
WORKDIR=$1
S3_REGION=$2
S3_BUCKET=$3
S3_PATH=$4

# influxdb
sudo service influxdb start
influx -execute 'CREATE DATABASE hyperflow'

# grafana
sudo service grafana-server start

# Start HyperFlow as a server
nohup env PORT=51404 WORKDIR=${WORKDIR} S3_BUCKET=${S3_BUCKET} S3_PATH=${S3_PATH} AMQP_URL=$(cat $HOME/AMQP_URL) REDIS_URL=$(cat $HOME/REDIS_URL) /node_modules/hyperflow/bin/hflow start-server -p hyperflow-monitoring-plugin &

# Run UI on port 80
export AWS_S3_REGION=${S3_REGION}
export AWS_S3_BUCKET=${S3_BUCKET}
export AWS_S3_PATH=${S3_PATH}
bash /hyperflow-ui/run.sh
