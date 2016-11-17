#!/bin/bash

# get visor information
#VISOR_HOST=$(ip route show | awk '/default/ {print $3}')
VISOR_HOST=localhost

### LOCATE PORT OF TELNET SERVER
#PORTS=( $(curl -s $VISOR_HOST:31415/monitors | jq '.[] | select(.port != null) | .port') )
#VISOR_PORT=${PORTS[0]}
VISOR_PORT=49152

echo "Waiting for visor telnet to launch on $VISOR_HOST:$VISOR_PORT"
while ! nc -zv $VISOR_HOST $VISOR_PORT; do   
  sleep 5
done

echo "Starting metric collector..."
env AMQP_URL=$(cat $HOME/AMQP_URL) VISOR_HOST=$VISOR_HOST VISOR_PORT=$VISOR_PORT hyperflow-amqp-metric-collector > metrics.log 2>&1 &
