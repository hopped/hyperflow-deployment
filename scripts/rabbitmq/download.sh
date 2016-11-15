#!/bin/bash
echo "START:download.sh"

### apt sources for rabbitmq
echo 'deb http://www.rabbitmq.com/debian/ kitten main' | tee /etc/apt/sources.list.d/rabbitmq.list
wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add -

echo "END:download.sh"
