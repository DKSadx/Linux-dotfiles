#!/bin/bash
x="$(pacmd list-sinks | grep muted | cut -d: -f2 | cut -d' ' -f2)"
#echo "$x"

if [ "$x" == "no" ]; then
	echo "not muted"
fi
if [ "$x" == "yes" ]; then
	echo "muted"
fi