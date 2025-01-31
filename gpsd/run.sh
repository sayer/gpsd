#!/usr/bin/with-contenv bash

echo -e "\n\n\nstarting gpsd: ${OPTIONS} ${DEVICE}"
date

# Start gpsd in the foreground
/usr/sbin/gpsd "${OPTIONS}" "${DEVICE}" || exit 1

# Wait for any process to exit
wait -n

echo "gpsd exited"

# Exit with status of process that exited first
exit $?
