#!/bin/bash
echo "START:install.sh"

echo "ENV:RabbitMQ " $PUBLIC_RabbitMQ_Required_By_Worker
echo amqp://$PUBLIC_RabbitMQ_Required_By_Worker > $HOME/AMQP_URL

cd $HOME

### ruby, mime-types, amqp-executor
tar -C /usr/local -xzf ruby-2.1.4.tgz
gem install mime-types
gem install --no-ri --no-rdoc hyperflow-amqp-executor

echo "END:install.sh"
