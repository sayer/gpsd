#!/usr/bin/with-contenv bash

# Set gpsd options from environment variables, or defaults
GPS_DEVICE=$(bashio::config 'device')
GPS_OPTIONS=$(bashio::config 'options')

env

modprobe pps_core

echo "starting gpsd: $GPS_OPTIONS - $GPS_DEVICE"

# Start gpsd in the foreground
/usr/sbin/gpsd $GPS_OPTIONS $GPS_DEVICE

echo "try again...."
/usr/sbin/gpsd -b -N -n /dev/ttyACM0

# Wait for any process to exit
#wait -n

echo "gpsd exited"

# Exit with status of process that exited first
exit $?
