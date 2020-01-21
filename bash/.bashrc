#
# ~/.bashrc
#
if [[ "$(tty)" = "/dev/tt1" ]]; then
	pgrep i3 || startx
fi

# Vi mode
set -o vi

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

ytAudio() {
	audio="$1"
	youtube-dl --extract-audio --audio-format mp3 -o '~/Music/%(title)s.%(ext)s' $audio
}
ytVideo() {
	video="$1"
	youtube-dl -o '~/Videos/%(title)s.%(ext)s' $video
}
manToPdf() {
	man="$1"
	man -Tpdf $man | zathura -
}
# Clear all package cache but last version
alias clearCache='paccache -rk1'
# Remove package and its dependenties
# pacman -Rcn
# Moves file into trash-bin instead deleting it
alias rm=trash-put
# Shows man in pdf
alias manp=manToPdf
alias ipi='ipconfig getifaddr en0'
# Shows external IP address
alias ipe='curl ipinfo.io/ip'
# Untar tar files
alias untar='tar -zxvf'
# Setup VPN
alias vpn='cat ~/VPN/VPNbook-us2/auth.txt ;sudo openvpn ~/VPN/VPNbook-us2/vpnbook-us2-udp25000.ovpn'
# Show public ip
alias pubip='dig +short myip.opendns.com @resolver1.opendns.com'
# Color cat - print file with syntax highlighting.
alias ccat="highlight --out-format=ansi" 
# Download youtube mp3 file
alias yta=ytAudio
  #alias yta="youtube-dl --extract-audio --audio-format mp3 -o '~/Music/%(title)s.%(ext)s'"
# Download youtube video file
alias ytv=ytVideo
  #alias ytv="youtube-dl -o '~/Videos/%(title)s.%(ext)s'"
# Custom neofetch
# alias neofetch="neofetch --w3m ~/Pictures/cyber_girl.jpg"
alias c='clear'
alias pac='sudo pacman -S'
# Launching python in tty
alias py='python'
# List all open ports
alias ports='lsof -i'
# Shortcut for debug compiling for C
alias gccc='gcc -g -Wall -o'
# Update and upgrade
alias update='pacman -Syu'
# Start named tmux session
alias tmuxn='tmux new -s'
# Shellcheck
alias sc='shellcheck'


# Removes background colors on directories
LS_COLORS=$LS_COLORS:'ow=1;34:tw=1;34:' ; export LS_COLORS
