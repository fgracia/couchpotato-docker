FROM debian:jessie

MAINTAINER Frederic GRACIA <gracia.frederic@gmail.com>

RUN apt-get update && \
    apt-get install -y python \
    python-cheetah \
    libssl-dev \
    git-core \
    unrar-free
RUN apt-get clean

WORKDIR /opt
RUN git clone https://github.com/sarakha63/CouchPotatoServer.git

COPY ./startup.sh /startup.sh
RUN chmod +x /startup.sh

EXPOSE 5050

VOLUME ["/opt", "/root/.couchpotato"]

CMD ["/startup.sh"]
