import os
import re
fields = open("/home/sadx/My_scripts/hdmi_save.txt","r")
for line in fields:
  fields = line.split(";")
count = fields[0]
#print(count[0])
if(count[0]=='1'):
  os.system("echo '0' > /home/sadx/My_scripts/hdmi_save.txt")
  os.system('exec xrandr --output LVDS-0 --auto --output HDMI-0 --auto --right-of LVDS-0')
 # os.system('pulseaudio -k')
  os.system('pactl set-card-profile 0 output:hdmi-surround-extra1')
elif(count[0]=='0'):
  os.system("echo '1' > /home/sadx/My_scripts/hdmi_save.txt")
  os.system('exec xrandr --output HDMI-0 --off')
  os.system('pactl set-card-profile 0 off')
  

  #check display names: xrandr
#pacmd list-cards    - check audio cards
#changes to hdmi sound output
#to HDMI
#pactl set-card-profile 0 output:hdmi-surround-extra1
#to internal
#pactl set-card-profile 0 off