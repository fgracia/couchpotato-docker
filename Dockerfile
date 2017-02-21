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

# App installation
ADD CouchPotatoServer /opt/CouchPotatoServer

# Creating custom_plugins folder
RUN mkdir -p /root/.couchpotato/custom_plugins

# Copying T411 plugin in a special directory, will be then copied in mounted /root/.couchpotato/custom_plugins when the app will starts
RUN mkdir -p /root/custom_plugins
ADD ./t411 /root/custom_plugins/

# Adding startup script
COPY ./startup.sh /startup.sh
RUN chmod +x /startup.sh

# Exposing port
EXPOSE 5050

# Volumes
VOLUME ["/opt", "/root/.couchpotato"]

# Running app
CMD ["/startup.sh"]
