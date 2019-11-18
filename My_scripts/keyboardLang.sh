#!/bin/bash

# Gets the current keyboard layout
CurrLayout=$( setxkbmap -query | grep layout | cut -d' ' -f6 )

if [ "$CurrLayout" == "us" ]; then
  setxkbmap -layout ba
  # xmodmap needs to be reloaded because setxkbmap overwrites it(if .Xmodmap is empty the line can be deleted )
  xmodmap ~/.Xmodmap
else
  setxkbmap -layout us
  xmodmap ~/.Xmodmap
fi