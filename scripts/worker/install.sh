#!/bin/bash
echo "START:install.sh"

echo "ENV:RabbitMQ " $PUBLIC_RabbitMQ_Required_By_Worker
echo amqp://$PUBLIC_RabbitMQ_Required_By_Worker > $HOME/AMQP_URL

cd $HOME

### nodejs, npm
tar -C /usr/local --strip-components 1 -xJf node-v4.5.0-linux-x64.tar.xz

### ruby, mime-types
tar -C /usr/local -xzf ruby-2.1.4.tgz
gem install mime-types


echo "END:install.sh"
