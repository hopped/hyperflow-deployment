#!/bin/bash
echo "START:start.sh"

nohup env AMQP_URL=$(cat $HOME/AMQP_URL) hyperflow-amqp-executor /etc/hyperflow-amqp-executor.yml &
