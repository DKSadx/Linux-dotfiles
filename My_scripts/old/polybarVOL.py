# -*- coding: utf-8 -*-
import os
import re
os.system("amixer | head -c 196 | tail -c 5 > ~/My_scripts/polyVol.txt")
fields = open("/home/sadx/My_scripts/polyVol.txt","r")
for line in fields:
  fields = line.split(";")
vol_value = fields[0]



if vol_value[2]== '%':
  vol_value = vol_value[:2]
elif vol_value[1]== '%':
  vol_value = 5
elif vol_value[3]== '%':
  vol_value = vol_value[1:3]
elif vol_value[4]== '%':
  vol_value = 100
else:
  vol_value = 0
# x = os.system('pacmd list-sinks | grep muted | cut -d: -f2 | cut -d" " -f2')
# x = str(x)
# print x[0]
print 'VOL: ' + str(vol_value) + '%',
volume =int(vol_value)/10
#amixer | head -c 194 | tail -c 2
if(volume == 10 ):
  print("──────────|")
elif(volume == 9 ):
  print("─────────|─")
elif(volume == 8 ):
  print("────────|──")
elif(volume == 7 ):
  print("───────|───")
elif(volume == 6 ):
  print("──────|────")
elif(volume == 5 ):
  print("─────|─────")
elif(volume == 4 ):
  print("────|──────")
elif(volume == 3 ):
  print("───|───────")
elif(volume == 2 ):
  print("──|────────")
elif(volume == 1 ):
  print("─|─────────")
elif(volume == 0 ):
  print("|──────────")

#amixer | grep "Left: Playback" | cut -d[ -f2 | cut -d% -f1  //// shows volume
#pacmd list-sinks | grep muted | cut -d: -f2 | cut -d" " -f2 //// shows mute/unmuted
