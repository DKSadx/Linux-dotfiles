#shortcut is mod+shift+h
#script for switching hdmi on/off
import os
import re
fields = open("/home/sadx/My_scripts/hdmi_save.txt","r")
for line in fields:
  fields = line.split(";")
count = fields[0]
#print(count[0])
if(count[0]=='1'):
  os.system('''sed -i '/1/d' /home/sadx/My_scripts/hdmi_save.txt''')
  os.system('''echo '0' >> /home/sadx/My_scripts/hdmi_save.txt''')
  os.system('exec xrandr --output LVDS-1 --auto --output HDMI-1 --auto --right-of LVDS-1')
  os.system('pulseaudio -k')
elif(count[0]=='0'):
  os.system('''sed -i '/0/d' /home/sadx/My_scripts/hdmi_save.txt''')
  os.system('''echo '1' >> /home/sadx/My_scripts/hdmi_save.txt''')
  os.system('exec xrandr --output HDMI-1 --off')


#call('exec urxvt')
#echo(count)
#if(count):
#  call('sed -i '/1/d' hdmi_save.txt')
#  call('echo '0' >> hdmi_save.txt')
#  call('exec gedit')
#else:
#  call('sed -i '/0/d' hdmi_save.txt')
#  call('echo '1' >> hdmi_save.txt')
#  call('exec urxvt')

