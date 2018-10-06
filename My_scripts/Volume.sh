#!/bin/bash

# Get the volume number
volume="$(amixer | grep 'Front Left: Playback' | cut -d[ -f2 | cut -d% -f1)"
# Get the state(muted/unmuted)
vol_state="$(pacmd list-sinks | grep muted | cut -d: -f2 | cut -d' ' -f2 | head -1)"

# Check if the sound is muted
if [ "$vol_state" == "no" ]; then
	final=$[volume/10]
	echo -n "VOL: $volume% "
	case $final in
		0) echo "|──────────";;
		1) echo "─|─────────";;
		2) echo "──|────────";;
		3) echo "───|───────";;
		4) echo "────|──────";;
		5) echo "─────|─────";;
		6) echo "──────|────";;
		7) echo "───────|───";;
		8) echo "────────|──";;
		9) echo "─────────|─";;
		10) echo "──────────|";;
	esac



else
	echo -n "VOL: 0% "
	echo "|──────────"
fi