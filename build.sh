#!/bin/bash

if [ -d t411 ] ; then
  rm -rf t411
fi
if [ -d CouchPotatoServer ] ; then
  rm -rf CouchPotatoServer
fi


git clone https://github.com/cocazoulou/couchpotato.provider.t411.git t411
git clone https://github.com/CouchPotato/CouchPotatoServer.git CouchPotatoServer

docker build -t fgracia/couchpotato .

rm -rf CouchPotatoServer
rm -rf t411
