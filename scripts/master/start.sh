#!/bin/bash
echo "START:start.sh"

WORKDIR=$1
S3_REGION=$2
S3_BUCKET=$3
S3_PATH=$4

# Start HyperFlow as a server
nohup env PORT=51404 WORKDIR=${WORKDIR} S3_BUCKET=${S3_BUCKET} S3_PATH=${S3_PATH} AMQP_URL=$(cat $HOME/AMQP_URL) REDIS_URL=$(cat $HOME/REDIS_URL) /node_modules/hyperflow/bin/hflow start-server -p hyperflow-monitoring-plugin &

# Run UI on port 51483
export REDIS_ACCESS=$(cat $HOME/REDIS_SHORT_URL)
export AWS_S3_REGION=${S3_REGION}
export AWS_S3_BUCKET=${S3_BUCKET}
export AWS_S3_PATH=${S3_PATH}
nohup /hyperflow-ui/run.sh > ui.log 2>&1 &
