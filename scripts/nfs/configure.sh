#!/bin/bash
echo "START:configure.sh"

# configure nfs server
mkdir /MD_v4_MPI
chmod -R 777 /MD_v4_MPI
echo "/MD_v4_MPI *(rw,sync,no_root_squash,fsid=1,no_subtree_check)" >> /etc/exports
exportfs -a

# source
. /etc/default/nfs-kernel-server
. /etc/default/nfs-common

rpcbind

### md simulation
cd ../../binaries && tar -C /MD_v4_MPI -xf md_v4_mpi_trusty.tar.gz
mv /MD_v4_MPI/* .
rm -rf /MD_v4_MPI/MD_v4_MPI

## ssh
ssh-keygen -t rsa -f $HOME/.ssh/id_rsa -N ''
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys

## modify ssh config
echo "    StrictHostKeyChecking no" | sudo tee -a /etc/ssh/ssh_config  
echo "    UserKnownHostsFile /dev/null" | sudo tee -a /etc/ssh/ssh_config

## copy into shared folder
cp -r $HOME/.ssh /opt/shared

service ssh restart

echo "END:configure.sh"
