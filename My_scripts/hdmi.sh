#!/bin/bash
# Gets the state of hdmi(connected/disconnected)
newDisplay="$(xrandr | grep -i "hdmi" | cut -d"(" -f1 | cut -d" " -f2 | head -n1)"
# Checks if the string equals "HDMI-0 connected "
if [ "$newDisplay" == "connected" ]; then
	# Sets output to HDMI
	xrandr --output eDP1 --auto --output HDMI1 --auto --right-of eDP1
	# Refresh the audio states
        pulseaudio -k
	# Sets Audiocard profile to HDMI-surround
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
#	~/My_scripts/polybarMultipleScreens.sh

else
	# Turns off HDMI output
	xrandr --output HDMI1 --off
	# Turns off HDMI audio output
	pactl set-card-profile 0 output:analog-stereo
	pulseaudio -k
fi

# Check video cards:
# xrandr
# Check sound cards:
# pacmd list-cards
