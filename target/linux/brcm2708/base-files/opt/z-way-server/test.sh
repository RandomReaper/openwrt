#!/bin/sh
FILE=/opt/z-way-server/automation/storage/configjson-06b2d3b23dce96e1619d2b53d6c947ec.json
ORIG=/rom/"$FILE"

if [ ! -e "$FILE" ]
then
	logger "z-way-server config file not found, get backup"
	cp "$ORIG" "$FILE"
	exit 1
fi

if ! grep -q "ttyUSB0" "$FILE"
then
	logger "z-way-server config file wrong, get backup"
        cp "$ORIG" "$FILE"
	exit 1
fi

exit 0
