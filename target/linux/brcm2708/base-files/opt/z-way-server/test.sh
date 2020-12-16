#!/bin/sh
FILE=/opt/z-way-server/automation/storage/configjson-06b2d3b23dce96e1619d2b53d6c947ec.json
ORIG=/rom/"$FILE"

logger "testing z-way-server configuration file"

if [ -e "$FILE" ]
then
	logger "config file exists"
else
	logger "config file not found, get backup"
	cp "$ORIG" "$FILE"
	exit 1
fi

if grep -q "ttyUSB0" "$FILE"
then
	logger "config seems OK"
else
	logger "config file wrong, get backup"
        cp "$ORIG" "$FILE"
	exit 1
fi

exit 0
