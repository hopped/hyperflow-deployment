#!/bin/bash
echo "START:install.sh"

# install dependencies
apt-get install -y nfs-kernel-server nfs-common

### md simulation
cd /hyperflow-deployment/binaries
tar -C /opt/shared/ -xf md_v4_mpi.tar.gz

echo "END:install.sh"
