#
# ~/.bashrc
#
if [[ "$(tty)" = "/dev/tt1" ]]; then
	pgrep i3 || startx
fi


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

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
# Custom neofetch
#alias neofetch="neofetch --w3m ~/Pictures/cyber_girl.jpg"
alias c='clear'
alias pac='sudo pacman -S'
#launching python in tty
alias py='python'
# removes background colors on directorys
LS_COLORS=$LS_COLORS:'ow=1;34:tw=1;34:' ; export LS_COLORS
