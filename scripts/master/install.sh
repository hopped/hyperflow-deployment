#!/bin/bash

cd $HOME

### nodejs, npm
tar -C /usr/local --strip-components 1 -xJf node-v4.5.0-linux-x64.tar.xz

### hyperflow
npm install https://github.com/hopped/hyperflow/archive/develop.tar.gz

### hyperflow-ui
mkdir /hyperflow-ui
tar zxv --no-same-owner --no-same-permissions -f hyperflow-ui.tar.gz -C /hyperflow-ui
