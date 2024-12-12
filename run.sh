#!/bin/bash

# Set gpsd options from environment variables, or defaults
GPS_DEVICE="${GPS_DEVICE:-/dev/ttyACM0}"
GPS_OPTIONS="${GPS_OPTIONS:-}"

# Start gpsd in the foreground
gpsd ${GPS_OPTIONS} ${GPS_DEVICE}

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?
