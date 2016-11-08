#!/bin/bash
echo "START:install.sh"

### rabbitmq
sudo apt-get update
sudo apt-get install -y rabbitmq-server

rabbitmq-plugins enable rabbitmq_management

echo "END:install.sh"
