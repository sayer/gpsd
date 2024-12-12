ARG BUILD_FROM
FROM $BUILD_FROM

# Set noninteractive mode
ARG DEBIAN_FRONTEND=noninteractive

# Update and install packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gpsd \
    && rm -rf /var/lib/apt/lists/*


# Create app directory
WORKDIR /coachproxy

EXPOSE 2947

# Run gpsd directly with full path
#CMD ["/usr/sbin/gpsd", "-N", "-n", "/dev/ttyACM0"]
CMD ["/gpsd/run.sh"]
