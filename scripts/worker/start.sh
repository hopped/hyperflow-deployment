#!/bin/bash
echo "START:start.sh"

# start monitoring of hyperflow jobs in the background
bash start-monitoring.sh &

# start the job executor
cd /hyperflow-amqp-executor
env AMQP_URL=$(cat $HOME/AMQP_URL) bundle exec bin/hyperflow-amqp-executor /etc/hyperflow-amqp-executor.yml > amqp.log 2>&1 &
