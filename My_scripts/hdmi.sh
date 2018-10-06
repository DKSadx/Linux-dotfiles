#!/bin/bash
# Gets the state of hdmi(connected/disconnected)
display="$(xrandr | grep -i "hdmi" | cut -d"(" -f1)"
# Checks if the string equals "HDMI-0 connected "
if [ "$display" == "HDMI-0 connected " ]; then
	# Sets output to HDMI
	xrandr --output LVDS-0 --auto --output HDMI-0 --auto --right-of LVDS-0
	# Refresh the audio states
        pulseaudio -k
	# Sets Audiocard profile to HDMI-surround
	pactl set-card-profile 0 output:hdmi-surround-extra1

else
	# Turns off HDMI output
	xrandr --output HDMI-0 --off
	# Turns off HDMI audio output
	pactl set-card-profile 0 off
fi

# Check video cards:
# xrandr
# Check sound cards:
# pacmd list-cards
