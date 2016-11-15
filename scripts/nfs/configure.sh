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

### md simulation
cd ../../binaries && tar -C /opt/shared/ -xf md_v4_mpi_trusty.tar.gz

## ssh
ssh-keygen -t rsa -f $HOME/.ssh/id_rsa -N ''
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys

## modify ssh config
echo "    StrictHostKeyChecking no" | sudo tee -a /etc/ssh/ssh_config  
echo "    UserKnownHostsFile /dev/null" | sudo tee -a /etc/ssh/ssh_config

## copy into shared folder
#cp -r $HOME/.ssh /opt/shared

service ssh restart

echo "END:configure.sh"
