import os
import re
fields = open("/home/sadx/My_scripts/hdmi_save.txt","r")
for line in fields:
  fields = line.split(";")
count = fields[0]
#print(count[0])
if(count[0]=='1'):
  os.system('''echo '0' > /home/sadx/My_scripts/hdmi_save.txt''')
  os.system('exec xrandr --output LVDS-1 --auto --output HDMI-1 --auto --right-of LVDS-1')
  os.system('pulseaudio -k')
elif(count[0]=='0'):
  os.system('''echo '1' > /home/sadx/My_scripts/hdmi_save.txt''')
  os.system('exec xrandr --output HDMI-1 --off')
