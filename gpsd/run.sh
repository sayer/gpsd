#!/usr/bin/with-contenv bashio

#set -x

env

DEVICE=$(bashio::config 'DEVICE')

echo "Starting gpsd script at $(date)"

DEVICE=$(bashio::config 'DEVICE')
OPTIONS=$(bashio::config 'OPTIONS')

# Set default values if variables are missing or empty
DEVICE=${DEVICE:-"/dev/ttyACM0"}
OPTIONS=${OPTIONS:-"-b -N -G -n"}

echo -e "DEVICE: ${DEVICE}"
echo -e "OPTIONS: ${OPTIONS}"

# Start gpsd in the foreground
/usr/sbin/gpsd ${OPTIONS} ${DEVICE} || echo "gpsd failed to start: $?"

# Wait for any process to exit
wait -n

echo "gpsd exited with status: $?"
echo "Exiting gpsd script at $(date)"

# Exit with status of process that exited first
exit $?
