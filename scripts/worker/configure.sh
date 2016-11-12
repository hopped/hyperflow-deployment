#!/bin/bash
echo "START:configure.sh"

# nfs mount point
mkdir /opt/shared
chown -R 777 /opt/shared
rpcbind
mount -t nfs4 -o proto=tcp,port=2049 $PUBLIC_NFSServer_Required_by_Worker:/opt/shared /opt/shared

echo "END:configure.sh"
