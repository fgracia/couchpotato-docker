FROM debian:jessie

MAINTAINER Frederic GRACIA <gracia.frederic@gmail.com>

# Installing packages
RUN apt-get update && \
    apt-get install -y python \
    python-cheetah \
    libssl-dev \
    git-core \
    unrar-free

# Cleaning apt cache
RUN apt-get clean

WORKDIR /opt

# Cloning CouchPotato sources
RUN git clone https://github.com/CouchPotato/CouchPotatoServer.git

# Adding t411 provider
RUN mkdir -p /root/.couchpotato/custom_plugins
COPY ./tmp/t411 /root/.couchpotato/custom_plugins/t411

# Adding startup script
COPY ./startup.sh /startup.sh
RUN chmod +x /startup.sh

# Exposing port
EXPOSE 5050

# Volumes
VOLUME ["/opt", "/root/.couchpotato"]

# Running app
CMD ["/startup.sh"]
