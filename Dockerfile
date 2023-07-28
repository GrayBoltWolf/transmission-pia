FROM buildpack-deps:stable

# Install dependencies
RUN apt-get update && \
    apt-get install -y ca-certificates openssl libssl-dev transmission curl sudo && \
    rm -rf /var/lib/apt/lists/*

# switch to non-root user
RUN groupadd -g 1000 container
RUN useradd -u 1000 -g container -s /bin/sh -m container
RUN adduser container sudo
# don't try this at home
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER 1000:1000
WORKDIR /home/container

# Download PIA
RUN curl https://installers.privateinternetaccess.com/download/pia-linux-3.3.1-06924.run --output pia.run

# Install PIA
RUN chmod +x pia.run
RUN ./pia.run

# open transmission-remote web port
EXPOSE 9091
CMD ["./start.sh"]
