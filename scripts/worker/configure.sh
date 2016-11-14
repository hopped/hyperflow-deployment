#!/bin/bash
echo "START:configure.sh"

export AMQP_URL=$(cat $HOME/AMQP_URL)
export THREADS=$(nproc)
export STORAGE=cloud
export AWS_REGION=$1
export AWS_ACCESS_KEY_ID=$2
export AWS_SECRET_ACCESS_KEY=$3

cat conf/hyperflow-amqp-executor.yml | envsubst > /etc/hyperflow-amqp-executor.yml

# nfs ip (remove port)
NFS_IP=$PUBLIC_NFSServer_Required_by_Worker
NFS_IP=${NFS_IP%%:*}

# nfs mount point
mkdir /opt/shared
chown -R 777 /opt/shared
rpcbind
mount -t nfs4 $NFS_IP:/opt/shared /opt/shared

echo "END:configure.sh"
