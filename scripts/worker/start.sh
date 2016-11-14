#!/bin/bash
echo "START:start.sh"

# get visor information
VISOR_HOST=$(ip route show | awk '/default/ {print $3}')

### LOCATE PORT OF TELNET SERVER
PORTS=( $(curl -s $VISOR_HOST:31415/monitors | jq '.[] | select(.port != null) | .port') )
VISOR_PORT=${PORTS[0]}

env AMQP_URL=$(cat $HOME/AMQP_URL) VISOR_HOST=$VISOR_HOST VISOR_PORT=$VISOR_PORT hyperflow-amqp-metric-collector &
env AMQP_URL=$(cat $HOME/AMQP_URL) hyperflow-amqp-executor /etc/hyperflow-amqp-executor.yml
