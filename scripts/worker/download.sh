#!/bin/bash
echo "START:download.sh"

cd $HOME

### nodejs, npm
wget https://nodejs.org/dist/v4.5.0/node-v4.5.0-linux-x64.tar.xz

### hyperflow-ui
wget https://github.com/hopped/hyperflow-ui/releases/download/0.2/hyperflow-ui.tar.gz

### ruby
wget https://s3.amazonaws.com/pkgr-buildpack-ruby/current/ubuntu-14.04/ruby-2.1.4.tgz

echo "END:download.sh"
