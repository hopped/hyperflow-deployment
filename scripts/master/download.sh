#!/bin/bash

cd $HOME

### install dependencies
apt-get update
apt-get -y install wget xz-utils

### nodejs, npm
wget https://nodejs.org/dist/v4.5.0/node-v4.5.0-linux-x64.tar.xz

### hyperflow-ui
wget https://github.com/hopped/hyperflow-ui/releases/download/0.2/hyperflow-ui.tar.gz
