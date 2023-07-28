FROM buildpack-deps:stable

# Install dependencies
RUN apt-get update && \
    apt-get install -y ca-certificates openssl libssl-dev transmission curl && \
    rm -rf /var/lib/apt/lists/*

# switch to non-root user
USER container
ENV  USER=container HOME=/home/container
WORKDIR /home/container

# Download PIA
RUN curl https://installers.privateinternetaccess.com/download/pia-linux-3.3.1-06924.run --output pia.run

# Install PIA
RUN chmod +x pia.run
RUN ./pia.run

# open transmission-remote web port
EXPOSE 9091
CMD ["./start.sh"]
