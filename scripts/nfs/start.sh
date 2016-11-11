#!/bin/bash
echo "START:start.sh"

service nfs-kernel-server start && inotifywait -m /opt/shared
