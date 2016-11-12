#!/bin/bash
echo "START:install.sh"

echo "ENV:NFS " $PUBLIC_NFSServer_Required_by_Worker

### extra dependencies for amqp-executor mainly
sudo apt-get install -y nfs-common

### nfs client
mkdir /opt/shared
chmod -R 777 /opt/shared
mount -t nfs4 "$PUBLIC_NFSServer_Required_by_Worker":/opt/shared /opt/shared

echo "END:install.sh"
