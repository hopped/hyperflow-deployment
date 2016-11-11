#!/bin/bash
echo "START:configure.sh"

# configure nfs server
mkdir /opt/shared
chmod -R 777 /opt/shared
echo "/opt/shared *(rw,sync,no_root_squash,fsid=1,no_subtree_check,insecure)" > /etc/exports
exportfs -a
echo "nfs		2049/tcp" >> /etc/services
echo "nfs		111/udp" >> /etc/services

# source
. /etc/default/nfs-kernel-server
. /etc/default/nfs-common
rpcbind

echo "END:configure.sh"
