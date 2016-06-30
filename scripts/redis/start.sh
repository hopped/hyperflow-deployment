#!/bin/bash
sed -i "s/bind\s127\.0\.0\.1/bind 0.0.0.0/" /etc/redis/redis.conf

/etc/init.d/redis-server start
exec sleep infinity
