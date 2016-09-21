#!/bin/bash

### nodejs, npm
cd $HOME
tar -C /usr/local --strip-components 1 -xJf node-v4.5.0-linux-x64.tar.xz

### hyperflow
cd /
npm install https://github.com/hopped/hyperflow/archive/develop.tar.gz
npm install https://github.com/dice-cyfronet/hyperflow-monitoring-plugin/archive/master.tar.gz
cp /hyperflow-deployment/cookbooks/workflows/templates/default/hyperflowMonitoringPlugin.config.js.erb /node_modules/hyperflow-monitoring-plugin/hyperflowMonitoringPlugin.config.js

### hyperflow-ui
mkdir /hyperflow-ui
cd $HOME && tar zxv --no-same-owner --no-same-permissions -f hyperflow-ui.tar.gz -C /hyperflow-ui
