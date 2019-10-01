#!/bin/bash
volume="$(cat ~/My_scripts/notifSound.sh | grep paplay | cut -d= -f2 | cut -d' ' -f1)"
if [ "$volume" == "0" ]; then
	sed -i -e '2s/0/20000/g' ~/My_scripts/notifSound.sh
elif [ "$volume" == "20000" ]; then
	sed -i -e '2s/20000/30000/g' ~/My_scripts/notifSound.sh
elif [ "$volume" == "30000" ]; then
	sed -i -e '2s/30000/45000/g' ~/My_scripts/notifSound.sh
elif [ "$volume" == "45000" ]; then
	sed -i -e '2s/45000/65536/g' ~/My_scripts/notifSound.sh
else
	sed -i -e '2s/65536/0/g' ~/My_scripts/notifSound.sh
fi
~/My_scripts/notifSound.sh
# paplay --volume=65536 /home/sadx/Music/notificiation/google.wav
