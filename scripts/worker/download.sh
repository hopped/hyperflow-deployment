#!/bin/bash
echo "START:download.sh"

cd $HOME

### ruby
wget https://s3.amazonaws.com/pkgr-buildpack-ruby/current/ubuntu-14.04/ruby-2.1.4.tgz

echo "END:download.sh"
