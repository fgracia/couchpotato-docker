#!/bin/bash

if [ -d t411 ] ; then
  rm -rf t411
fi
if [ -d CouchPotato ] ; then
  rm -rf CouchPotato
fi


git clone https://github.com/cocazoulou/couchpotato.provider.t411.git t411
git clone https://github.com/CouchPotato/CouchPotatoServer.git CouchPotatoServer

docker build -t fgracia/couchpotato .

rm -rf CouchPotato
rm -rf t411
