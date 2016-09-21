#!/bin/bash
echo amqp://$PUBLIC_RabbitMQ_Required_by_Master > $HOME/AMQP_URL
echo redis://$PUBLIC_Redis_Required_by_Master > $HOME/REDIS_URL
