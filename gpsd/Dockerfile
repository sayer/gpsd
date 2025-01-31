ARG BUILD_FROM
FROM $BUILD_FROM

# Set noninteractive mode
ARG DEBIAN_FRONTEND=noninteractive

# Update and install packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    jq \
    gpsd \
    kmod \
    && rm -rf /var/lib/apt/lists/*

 # Create app directory
 WORKDIR /gpsd

 # Copy startup script
 COPY run.sh /gpsd/

# Set execute permissions
 RUN chmod +x /gpsd/run.sh && \
     chown -R root:root /gpsd

EXPOSE 2947

# Healthcheck to ensure gpsd is running
HEALTHCHECK --interval=300s --timeout=10s --start-period=5s CMD pgrep gpsd || exit 1

# Run the script that lunaches gpsd
CMD ["/gpsd/run.sh"]
