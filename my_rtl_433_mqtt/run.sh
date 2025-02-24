#!/bin/sh

MQTT_HOST=$(jq -r '.mqtt_host' /data/options.json)
MQTT_PORT=$(jq -r '.mqtt_port' /data/options.json)
MQTT_USER=$(jq -r '.mqtt_user' /data/options.json)
MQTT_PASS=$(jq -r '.mqtt_password' /data/options.json)

MQTT_DEVICE="rtl_433/devices[/type][/model][/subtype][/channel][/id]"

MQTT_URL="mqtt://${MQTT_HOST}:${MQTT_PORT},user=${MQTT_USER},pass=${MQTT_PASS},retain=0,devices=${MQTT_DEVICE}"

echo "lsusb"
lsusb
date
cd /usr/src/rtl_433
git rev-parse --short HEAD
#echo "<<< ${MQTT_URL} >>>"
#echo "rtl_433 -R -215 -F ${MQTT_URL} -F log"
echo "Starting rtl_433 with MQTT..."
rtl_433 -R -215 -F "${MQTT_URL}" -F log
