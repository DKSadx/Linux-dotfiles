#!/bin/bash
# Gets the state of hdmi(connected/disconnected)
display="$(xrandr | grep -i "hdmi" | cut -d"(" -f1 | cut -d" " -f2 | head -n1)"
# Checks if the string equals "HDMI-0 connected "
if [ "$display" == "connected" ]; then
	# Sets output to HDMI
	xrandr --output eDP1 --auto --output HDMI1 --auto --right-of eDP1
	# Refresh the audio states
        pulseaudio -k
	# Sets Audiocard profile to HDMI-surround
	pactl set-card-profile 0 output:hdmi-stereo

else
	# Turns off HDMI output
	xrandr --output HDMI1 --off
	# Turns off HDMI audio output
	pactl set-card-profile 0 output:analog-stereo
fi

# Check video cards:
# xrandr
# Check sound cards:
# pacmd list-cards
