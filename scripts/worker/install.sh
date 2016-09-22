#!/bin/bash
echo "START:install.sh"

echo "ENV:RabbitMQ " $PUBLIC_RabbitMQ_Required_By_Worker
echo amqp://$PUBLIC_RabbitMQ_Required_By_Worker > $HOME/AMQP_URL

sudo apt-get install -y mencoder libgomp1 build-essential libxml2-dev zlib1g-dev

cd $HOME

### povray
tar xvfz povlinux-3.6.tgz
cd povray-3.6 && ./install -no-arch-check

### md simulation
cd /hyperflow-deployment/binaries && tar xvfz md_v4_omp.tgz
mv /hyperflow-deployment/binaries/MD_v4_OMP /

cd $HOME

### ruby, mime-types, amqp-executor
tar -C /usr/local -xzf ruby-2.1.4.tgz
gem install --no-ri --no-rdoc mime-types
gem install --no-ri --no-rdoc hyperflow-amqp-executor

echo "END:install.sh"
