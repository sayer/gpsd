#!/bin/bash

# Set gpsd options from environment variables, or defaults
#GPS_DEVICE="${GPS_DEVICE:-/dev/ttyACM0}"
#GPS_OPTIONS="${GPS_OPTIONS:-}"

ls -l /usr/sbin/gpsd

echo "starting gpsd: ${GPS_OPTIONS} ${GPS_DEVICE}"

# Start gpsd in the foreground
/usr/sbin/gpsd ${GPS_OPTIONS} ${GPS_DEVICE}

# Wait for any process to exit
#wait -n

echo "gpsd exited"

# Exit with status of process that exited first
exit $?
