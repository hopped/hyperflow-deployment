#!/bin/bash
echo "START:install.sh"

# install dependencies
apt-get install -y nfs-kernel-server nfs-common inotify-tools

echo "END:install.sh"
