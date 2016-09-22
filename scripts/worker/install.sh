#!/bin/bash

echo "START:install.sh"

cd $HOME

### nodejs, npm
tar -C /usr/local --strip-components 1 -xJf node-v4.5.0-linux-x64.tar.xz

### ruby
tar -C /usr/local -xzf ruby-2.1.4.tgz


echo "END:install.sh"
