#!/bin/bash

wifi="$(nmcli dev wifi | grep "*" | cut -d" " -f8)"
if [ "$wifi" == "" ]; then
	echo "Not connected"
else
	echo "$wifi"
 fi 