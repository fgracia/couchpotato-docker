#!/bin/bash

git clone https://github.com/cocazoulou/couchpotato.provider.t411.git tmp

docker build -t fgracia/couchpotato .

rm -rf tmp
