#!/bin/bash
export CONFIG_DIR=/data
export CONFIG_PATH=/data/options.json

MQTT_HOST="$(jq --raw-output '.host' $CONFIG_PATH)"

echo "Hello world! About to start bridge and connect to mqtt host: ${MQTT_HOST}"

npm start
