#!/bin/bash
echo "START:install.sh"

echo "ENV:RabbitMQ " $PUBLIC_RabbitMQ_Required_By_Worker
echo amqp://$PUBLIC_RabbitMQ_Required_By_Worker > $HOME/AMQP_URL

sudo apt-get install mencoder libgomp1

cd $HOME

### povray
tar xvfz povlinux-3.6.tgz
cd povray-3.6 && ./install -no-arch-check

### md simulation
cd $HOME/hyperflow-deployment/binaries && tar xvfz md_v4_omp.tgz
mv $HOME/hyperflow-deployment/binaries/MD_v4_OMP /

### ruby, mime-types, amqp-executor
tar -C /usr/local -xzf ruby-2.1.4.tgz
gem install mime-types
gem install --no-ri --no-rdoc hyperflow-amqp-executor

echo "END:install.sh"
