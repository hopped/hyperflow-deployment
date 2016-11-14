#!/bin/bash
echo "START:configure.sh"

# nfs ip (remove port)
NFS_IP=$PUBLIC_NFSServer_Required_by_Worker
NFS_IP=${NFS_IP%%:*}

# nfs mount point
mkdir /opt/shared
chown -R 777 /opt/shared
rpcbind
mount -t nfs4 $NFS_IP:/opt/shared /opt/shared

echo "END:configure.sh"
