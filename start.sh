#!/bin/sh
PYTHON=/usr/bin/python
COUCH=/CouchPotatoServer
DATA=/Config/CouchPotatoServer

if [ -d $DATA ] && [ -r $DATA/settings.conf ];
then
	echo "Couchpotato already prepared for action! Going to start the madness!"
	$PYTHON $COUCH/CouchPotato.py --data_dir=$DATA --config_file=$DATA/settings.conf
else
	echo "Setting up Couchpotato environment. BITCH!"
	mkdir -p $DATA
	mv $COUCH/settings.conf $DATA
	$PYTHON $COUCH/CouchPotato.py --data_dir=$DATA --config_file=$DATA/settings.conf
fi
