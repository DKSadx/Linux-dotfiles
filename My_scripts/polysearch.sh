#!/bin/bash

msg="<b>p=incognito</b>"
search=$(rofi -lines 2 -mesg ${msg} -theme Arc-Dark -dmenu -p "Google Search") 
if [ "$search" == "" ]; then exit
elif [ "$search" == "p" ]; then
	search=$(rofi -lines 2 -theme Arc-Dark -dmenu -p "(incognito)Google Search") 
	if [ "$search" == "" ]; then exit
	else
	google-chrome-stable --incognito "https://www.google.com/search?q=${search}"
	fi
else
	google-chrome-stable "https://www.google.com/search?q=${search}"
fi
