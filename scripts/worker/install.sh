#!/bin/bash
echo "START:install.sh"

echo "ENV:RabbitMQ $PUBLIC_RabbitMQ_Required_by_Worker"
echo "ENV:NFS $PUBLIC_NFSServer_Required_by_Worker"
echo amqp://$PUBLIC_RabbitMQ_Required_by_Worker > $HOME/AMQP_URL

### extra dependencies for amqp-executor mainly
sudo apt-get install -y mencoder gettext-base mpich bc openssh-server nfs-common

echo "WORKER: PWD=$PWD"

### povray
tar -xzf povlinux-3.6.tgz
cd povray-3.6 && ./install -no-arch-check

### ruby, mime-types, amqp-executor
tar -C /usr/local -xzf ruby-2.1.4.tgz
tar -C / -xf executor.tar.gz
gem install --no-ri --no-rdoc bundler

echo "END:install.sh"
