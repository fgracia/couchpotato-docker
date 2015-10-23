# Docker CouchPotato

This is a Dockerfile to deploy CouchPotato Server.

## How to run

Here's how you can run the container :

```
docker run --restart=always --name couchpotato -d -p 5050:5050 -v /etc/localtime:/etc/localtime:ro -v /<local-directory-for-config-files>:/root/.couchpotato fgracia/couchpotato
```

Where :

* **--restart=always** : allows to automatically restart the container if it stops, of if the host reboots (optional)
* **--name couchpotato** : you can choose the name you want
* **-d** : daemon mode
* **-p 5050:5050** : maps the default HTTP port
* **-v /etc/localtime:/etc/localtime:ro** : sets the UTC like the host (optional)
* **-v /local-directory-for-config-files:/root/.couchpotato** : if you want persistent data files, you can choose a local directory (optional)

If you use post-processing actions, you may need to mount other data volumes.


## Docker Compose

Because of an hard docker run command to remember, you can use docker-compose (see the YAML script in the compose folder). 
You will juste have to adapt data volumes and then run :

```
docker-compose up -d
```
