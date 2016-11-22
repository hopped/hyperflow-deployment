#!/bin/bash
echo "START:download.sh"

cd $HOME

### nodejs, npm
wget https://nodejs.org/dist/v4.5.0/node-v4.5.0-linux-x64.tar.xz

### hyperflow-ui
wget https://github.com/hopped/hyperflow-ui/releases/download/0.6/hyperflow-ui.tar.gz

### influxdb
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

### grafana
echo "deb https://packagecloud.io/grafana/stable/debian/ wheezy main" | sudo tee /etc/apt/sources.list.d/grafana.list
curl https://packagecloud.io/gpg.key | sudo apt-key add -

echo "END:download.sh"
