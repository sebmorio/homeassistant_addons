#!/bin/sh

MQTT_HOST=$(bashio::config 'mqtt_host')
MQTT_PORT=$(bashio::config 'mqtt_port')
MQTT_USER=$(bashio::config 'mqtt_user')
MQTT_PASS=$(bashio::config 'mqtt_password')

MQTT_DEVICE="rtl_433/devices[/type][/model][/subtype][/channel][/id]"

MQTT_URL="mqtt://${MQTT_HOST}:${MQTT_PORT},user=${MQTT_USER},pass=${MQTT_PASS},retain=0,devices=${MQTT_DEVICE}"

echo "<<< ${MQTT_URL} >>>"
echo "Démarrage de rtl_433 avec MQTT..."
rtl_433 -R -215 -F "${MQTT_URL}" 
