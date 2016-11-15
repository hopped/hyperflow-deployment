#!/bin/bash
echo "START:install.sh"

### rabbitmq
apt-get update && apt-get install -y rabbitmq-server

rabbitmq-plugins enable rabbitmq_management

echo "END:install.sh"
