#!/bin/bash
echo "START:install.sh"

echo "ENV:RabbitMQ " $PUBLIC_RabbitMQ_Required_By_Hyperflow
echo "ENV:Redis " $PUBLIC_Redis_Required_By_Hyperflow

echo amqp://$PUBLIC_RabbitMQ_Required_By_Hyperflow > $HOME/AMQP_URL
echo redis://$PUBLIC_Redis_Required_By_Hyperflow > $HOME/REDIS_URL

cd $HOME

### nodejs, npm
tar -C /usr/local --strip-components 1 -xJf node-v4.5.0-linux-x64.tar.xz

### ruby
tar -C /usr/local -xzf ruby-2.1.4.tgz


echo "END:install.sh"
