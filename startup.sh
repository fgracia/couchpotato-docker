#!/bin/sh

# Checking if external data config is present, and integrate
if [ -f /data/settings.conf ]
then
	rm -f /root/.couchpotato/settings.conf
	ln -s /data/settings.conf /root/.couchpotato/settings.conf
fi

if [ -d /data/logs ]
then
	rm -rf /root/.couchpotato/logs
	ln -s /data/logs /root/.couchpotato/logs
fi

if [ -d /data/database ]
then
	rm -rf /root/.couchpotato/database
	ln -s /data/database /root/.couchpotato/database
fi

if [ -d /data/custom_plugins ]
then
	rm -rf /root/.couchpotato/custom_plugins
	ln -s /data/custom_plugins /root/.couchpotato/custom_plugins
else
	mkdir /root/.couchpotato/custom_plugins
fi

if [ -d /data/cache ]
then
	rm -rf /root/.couchpotato/cache
	ln -s /data/cache /root/.couchpotato/cache
fi

cp -r /root/custom_plugins/t411 /root/.couchpotato/custom_plugins/t411

# Running CouchPotato
/usr/bin/python /opt/CouchPotatoServer/CouchPotato.py
