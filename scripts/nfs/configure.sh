#!/bin/bash
echo "START:configure.sh"

. /etc/default/nfs-kernel-server
. /etc/default/nfs-common
rpcbind

echo "END:configure.sh"
