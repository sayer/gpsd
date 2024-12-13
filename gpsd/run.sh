#!/usr/bin/with-contenv bash


echo "\n\n\nstarting gpsd: ${OPTIONS} ${DEVICE}"

# Start gpsd in the foreground
/usr/sbin/gpsd ${OPTIONS} ${DEVICE}

# Wait for any process to exit
wait -n

echo "gpsd exited"

# Exit with status of process that exited first
exit $?
