#!/bin/bash
echo "START:start.sh"

# start monitoring of hyperflow jobs in the background
bash start-monitoring.sh > start-monitoring.log 2>&1 &

# start the job executor
cd /
env AMQP_URL=$(cat $HOME/AMQP_URL) hyperflow-amqp-executor /etc/hyperflow-amqp-executor.yml > amqp.log 2>&1 &
