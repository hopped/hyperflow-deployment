
#!/bin/bash
echo "START:start.sh"

cd /hyperflow-amqp-executor
env AMQP_URL=$(cat $HOME/AMQP_URL) bundle exec bin/hyperflow-amqp-executor /etc/hyperflow-amqp-executor.yml
