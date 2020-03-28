#!/bin/bash

msg="Choose option"
options="m = mirror screens 
s = split screen
0 = disconnect all screens but main"
option="$(rofi -dmenu -theme Nebula -mesg "$options" -p "$msg")"

if [ "$option" == "" ]; then exit
elif [ "$option" == "m" ] || [ "$option" == "s" ]; then
	if [ "$option" == "m" ]; then
		mode="--same-as"
	elif [ "$option" == "s" ]; then
		mode="--right-of"
	fi

	mainScreen="$(xrandr | grep " connected " | head -1 | cut -d" " -f1)"
        display="$(xrandr | grep " connected" | cut -d" " -f1 | rofi -dmenu -theme Nebula -p "Choose display")"

	if [ "$display" != "" ] && [ "$display" != "$mainScreen" ]; then
		# Sets output to HDMI
		xrandr --output $mainScreen --auto --output $display --auto $mode $mainScreen
		# Refresh the audio states
		pulseaudio -k
		# Sets Audiocard profile to HDMI-stereo
		pactl set-card-profile 0 output:hdmi-stereo
		# Enables polybar for all monitors
		killall polybar
		# Custom script, source: https://github.com/polybar/polybar/issues/763
		if type "xrandr"; then
			for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
				MONITOR=$m polybar --reload example &
			done
		else
			polybar --reload example &
		fi
	fi
elif [ "$option" == "0" ]; then
	for d in $(xrandr | grep " connected" | cut -d" " -f1); do
		mainScreen="$(xrandr | grep " connected " | head -1 | cut -d" " -f1)"
		if [ "$d" != "$mainScreen" ]; then
			echo "works"
			# Turns off output for all displays but main one
			xrandr --output $d --off
			# Turns off HDMI audio output
			pactl set-card-profile 0 output:analog-stereo
			pulseaudio -k
		fi
	done
fi
