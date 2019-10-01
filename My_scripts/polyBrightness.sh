#!/bin/bash
MON="eDP1"    # Discover monitor name with: xrandr | grep " connected"
CurrBright=$( xrandr --verbose --current | grep ^"$MON" -A5 | tail -n1 | cut -d" " -f2 )
echo $CurrBright

