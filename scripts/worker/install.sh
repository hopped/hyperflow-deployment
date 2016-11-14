#!/bin/bash
echo "START:install.sh"

echo "ENV:RabbitMQ " $PUBLIC_RabbitMQ_Required_by_Worker
echo amqp://$PUBLIC_RabbitMQ_Required_by_Worker > $HOME/AMQP_URL

### extra dependencies for amqp-executor mainly
sudo apt-get install -y mencoder libgomp1 build-essential libxml2-dev zlib1g-dev gettext-base mpich bc jq

### povray
cd $HOME
tar -xzf povlinux-3.6.tgz
cd povray-3.6 && ./install -no-arch-check

### md simulation
cd /hyperflow-deployment/binaries
tar -C / -xf md_v4_mpi.tar.gz

### ruby, mime-types, amqp-executor
cd $HOME
JOBS=$[$(nproc)-1]
tar -C /usr/local -xzf ruby-2.1.4.tgz
gem install bundle
bundle config --global jobs $JOBS
gem install --no-ri --no-rdoc mime-types
gem install --no-ri --no-rdoc hyperflow-amqp-executor

echo "END:install.sh"
