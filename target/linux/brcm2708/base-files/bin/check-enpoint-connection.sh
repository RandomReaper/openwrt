#!/bin/sh
if ! netstat -tanp | grep java | grep 8883 ;
then
	logger "endpoint mqtt connection fail"
  exit 1
fi

exit 0
