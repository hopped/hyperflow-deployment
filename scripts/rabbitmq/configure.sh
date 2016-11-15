#!/bin/bash
echo "START:configure.sh"

service rabbitmq-server stop
echo [{rabbit, [{loopback_users, []}]}]. > /etc/rabbitmq/rabbitmq.config

echo "END:configure.sh"
