#!/usr/bin/with-contenv bashio

set -x

env

echo "Starting gpsd script at $(date)"

# Set default values if variables are missing or empty
GPSDEVICE=${GPSDEVICE:-"/dev/ttyACM0"}
GPSOPTIONS=${GPSOPTIONS:-"-b -N -G -n"}

echo -e "DEVICE: ${GPSDEVICE}"
echo -e "OPTIONS: ${GPSOPTIONS}"

# Start gpsd in the foreground
/usr/sbin/gpsd ${GPSOPTIONS} ${GPSDEVICE} || echo "gpsd failed to start: $?"

# Wait for any process to exit
wait -n

echo "gpsd exited with status: $?"
echo "Exiting gpsd script at $(date)"

# Exit with status of process that exited first
exit $?
