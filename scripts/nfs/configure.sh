#!/bin/bash
echo "START:configure.sh"

# configure nfs server
mkdir /opt/shared
chmod -R 777 /opt/shared
echo "/opt/shared *(rw,sync,no_root_squash,fsid=1,no_subtree_check)" >> /etc/exports
exportfs -a

# source
. /etc/default/nfs-kernel-server
. /etc/default/nfs-common

rpcbind

echo "END:configure.sh"
