#!/bin/bash
echo "START:configure.sh"

if [ ${STORAGE} == "cloud" ]; then
    export AWS_REGION=$1
    export AWS_ACCESS_KEY_ID=$2
    export AWS_SECRET_ACCESS_KEY=$3
    if [ -f ${FILE} ]; then
      echo "${FILE}: Using CLOUD storage for storing simulation results"
      cat ${FILE} | jq --arg z ${AWS_REGION} --arg x ${AWS_ACCESS_KEY_ID} --arg y ${AWS_SECRET_ACCESS_KEY} '.amqp_executor=(.amqp_executor + { STORAGE: "cloud", AWS_REGION: $z, AWS_ACCESS_KEY_ID: $x, AWS_SECRET_ACCESS_KEY: $y })' > tmp.json
      mv tmp.json ${FILE}
    fi
  fi
  if [ -f ${FILE} ]; then
    echo "${FILE}: Updating URL for AMQP"
    cat ${FILE} | jq --arg x amqp://${PUBLIC_RabbitMQ_Required_by_Worker} '.amqp_executor=(.amqp_executor + { AMQP_URL: $x })' > tmp.json
    mv tmp.json ${FILE}
  fi
done


echo "END:configure.sh"
