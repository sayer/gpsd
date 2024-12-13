ARG BUILD_FROM
FROM $BUILD_FROM

# Set noninteractive mode
ARG DEBIAN_FRONTEND=noninteractive

# Update and install packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gpsd \
    kmod \
    bashio \
    && rm -rf /var/lib/apt/lists/*


 # Create app directory
 WORKDIR /gpsd

 # Copy startup script
 COPY run.sh /gpsd/

# Set execute permissions
 RUN chmod +x /gpsd/run.sh && \
     chown -R root:root /gpsd

EXPOSE 2947

ENV DEVICE="/dev/ttyACM0"
ENV OPTIONS="-n -N -b"

# Run the script that lunaches gpsd
CMD ["/gpsd/run.sh"]
