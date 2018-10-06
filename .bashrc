# .bashrc
# source ~/.bashrc   ---> refreshes bashrc so the changes apply
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
PS1='[\u@\h: \W\]]$ '
alias c='clear'
#Shows local IP address
alias ipi='ipconfig getifaddr en0'
#Shows external IP address
alias ipe='curl ipinfo.io/ip'
#Untar
alias untar='tar -zxvf'
#Setup VPN
alias vpn='cat ~/VPN/VPNbook-us2/auth.txt ;sudo openvpn ~/VPN/VPNbook-us2/vpnbook-us2-udp25000.ovpn'
#Show public ip
alias pubip='dig +short myip.opendns.com @resolver1.opendns.com'
alias ccat="highlight --out-format=ansi" # Color cat - print file with syntax highlighting.
# Download youtube mp3 file
alias yta="youtube-dl --extract-audio --audio-format mp3 -o '~/Music/%(title)s.%(ext)s'"
# Download youtube video file
alias ytv="youtube-dl -o '~/Videos/%(title)s.%(ext)s'"
