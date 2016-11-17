#!/bin/bash
echo "START:configure.sh"

echo "NFS Server: $PUBLIC_NFSServer_Required_by_Worker"
echo "RabbitMQ Mgt Port: $PUBLIC_RabbitMQMgtPort_Required_by_Worker"
echo "Master Server: $PUBLIC_Master_Required_by_Worker"

export AMQP_URL=$(cat $HOME/AMQP_URL)
export THREADS=$(nproc)
export STORAGE=cloud
export AWS_REGION=$1
export AWS_ACCESS_KEY_ID=$2
export AWS_SECRET_ACCESS_KEY=$3

# update yml configuration of amqp-executor
cat conf/hyperflow-amqp-executor.yml | envsubst > /etc/hyperflow-amqp-executor.yml

# overwrite existing metric collector with new version
mv conf/hyperflow-amqp-metric-collector /usr/local/lib/ruby/gems/2.1.0/gems/hyperflow-amqp-executor-1.0.1/bin/

# nfs ip (remove port)
NFS_IP=$PUBLIC_NFSServer_Required_by_Worker
NFS_IP=${NFS_IP%%:*}

MASTER_IP=$PUBLIC_Master_Required_by_Worker
MASTER_IP=${MASTER_IP%%:*}

echo "NFS host: $NFS_IP"
echo "Master host: $MASTER_IP"

# nfs mount point
mkdir /opt/shared
chown -R 777 /opt/shared
rpcbind
mount -t nfs4 "$NFS_IP":/opt/shared /opt/shared

# add update check into run-cmd.sh
sed -i '56i \    $(curl -sS -u guest:guest "http://'$PUBLIC_RabbitMQMgtPort_Required_by_Worker'/api/consumers" | jq --raw-output .[].channel_details.peer_host > /opt/shared/MD_v4_MPI/hostfile.txt)' /opt/shared/MD_v4_MPI/run-cmd.sh
sed -i '57i \    $(sed -i "/'$MASTER_IP'/d" /opt/shared/MD_v4_MPI/hostfile.txt)' /opt/shared/MD_v4_MPI/run-cmd.sh

# ssh configuration
echo "    StrictHostKeyChecking no" | sudo tee -a /etc/ssh/ssh_config  
echo "    UserKnownHostsFile /dev/null" | sudo tee -a /etc/ssh/ssh_config
cp /opt/shared/.ssh/* $HOME/.ssh
chown ubuntu:ubuntu -R $HOME/.ssh

service ssh restart

echo "END:configure.sh"
