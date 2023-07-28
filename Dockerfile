FROM buildpack-deps:stable

# Install dependencies
RUN apt-get update && \
    apt-get install -y ca-certificates openssl libssl-dev transmission curl && \
    rm -rf /var/lib/apt/lists/*

# Download PIA
RUN curl https://installers.privateinternetaccess.com/download/pia-linux-3.3.1-06924.run --output pia.run

# Install PIA
RUN chmod +x pia.run
RUN ./pia.run

EXPOSE 9091
CMD ["./start.sh"]
