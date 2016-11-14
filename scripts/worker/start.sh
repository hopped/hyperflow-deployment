#!/bin/bash
echo "START:start.sh"

# start monitoring of hyperflow jobs in the background
bash start-monitoring.sh &

# start the job executor
env AMQP_URL=$(cat $HOME/AMQP_URL) hyperflow-amqp-executor /etc/hyperflow-amqp-executor.yml
