#!/bin/bash
ROOT=../..
cd ${ROOT}

# Set URLs to access RabbitMQ and Redis
echo amqp://$PUBLIC_RabbitMQ_Required_by_Master > AMQP_URL
echo redis://$PUBLIC_Redis_Required_by_Master > REDIS_URL
