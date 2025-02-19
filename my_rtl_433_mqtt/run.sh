#!/bin/sh

MQTT_HOST=$(bashio::config 'mqtt_host')
MQTT_PORT=$(bashio::config 'mqtt_port')
MQTT_USER=$(bashio::config 'mqtt_user')
MQTT_PASS=$(bashio::config 'mqtt_password')

MQTT_CLIENT_ID="rtl_433_$(hostname)"  # Utilise le nom du conteneur ou un préfixe
MQTT_URL="mqtt://${MQTT_USER}:${MQTT_PASS}@${MQTT_HOST}:${MQTT_PORT},retain=0,client_id=${MQTT_CLIENT_ID}"

echo "Démarrage de rtl_433 avec MQTT..."
rtl_433 -R -215 -F "${MQTT_URL}"
