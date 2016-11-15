#!/bin/bash
echo "START:install.sh"

# install dependencies
apt-get install -y nfs-kernel-server openssh-server nfs-common

echo "END:install.sh"
