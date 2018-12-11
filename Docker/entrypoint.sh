#!/bin/bash
set -e

# Ensure all users can see the DOCKER environment vars
# Neede if you want to perform actions as www-data
env | grep _ >> /etc/environment

# Apache can't cope with memory shared files existing
rm -f /var/run/apache2/*
rm -rf /tmp/*

# Start Filebeat (nohup to run in fork)
#sudo nohup /etc/init.d/filebeat start &

# Run apache in foreground
apache2ctl -D FOREGROUND

