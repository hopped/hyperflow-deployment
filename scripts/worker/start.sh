#!/bin/bash
echo "START:start.sh"

env AMQP_URL=$(cat $HOME/AMQP_URL) hyperflow-amqp-metric-collector &
env AMQP_URL=$(cat $HOME/AMQP_URL) hyperflow-amqp-executor /etc/hyperflow-amqp-executor.yml
