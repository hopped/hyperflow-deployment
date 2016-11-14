#!/bin/bash
echo "Waiting for visor telnet to launch... "

while ! nc -z localhost 8080; do   
  sleep 0.1 # wait for 1/10 of the second before check again
done
