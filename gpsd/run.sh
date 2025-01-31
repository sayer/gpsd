#!/usr/bin/with-contenv bash

set -x

env

echo "Starting gpsd script at $(date)"

echo -e "DEVICE: ${DEVICE}"
echo -e "OPTIONS: ${OPTIONS}"

# Start gpsd in the foreground
/usr/sbin/gpsd -V "${OPTIONS}" "${DEVICE}" || echo "gpsd failed to start: $?"

# Wait for any process to exit
wait -n

echo "gpsd exited with status: $?"
echo "Exiting gpsd script at $(date)"

# Exit with status of process that exited first
exit $?
