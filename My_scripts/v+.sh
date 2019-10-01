#!/bin/bash
pactl set-sink-mute 0 false ; pactl set-sink-volume 0 +5%
#amixer -q sset Master 5%+; amixer sset Master unmute
#amixer -D pulse sset Master 5%+; amixer sset Master unmute
