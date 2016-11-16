#!/bin/bash
echo "START:download.sh"

cd $HOME

### povray
wget -q http://gd.tuwien.ac.at/graphics/raytracing/povray/Official/Linux/povlinux-3.6.tgz

### ruby
wget -q https://s3.amazonaws.com/pkgr-buildpack-ruby/current/ubuntu-14.04/ruby-2.1.4.tgz

echo "END:download.sh"
