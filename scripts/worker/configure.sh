#!/bin/bash
echo "START:configure.sh"

export AMQP_URL=$(cat $HOME/AMQP_URL)
export STORAGE=cloud
export AWS_REGION=$1
export AWS_ACCESS_KEY_ID=$2
export AWS_SECRET_ACCESS_KEY=$3

cat conf/hyperflow-amqp-executor.yml | envsubst > /etc/hyperflow-amqp-executor.yml

echo "END:configure.sh"
