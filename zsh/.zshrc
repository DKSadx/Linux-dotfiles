
# ---------------------------------------------- #
# --------------- Aliases ---------------------- #
# ---------------------------------------------- #
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
# Start vim in insert mode
alias vim='vim -c "startinsert"'
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

# ---------------------------------------------- #
# --------------- Oh-my-zsh stuff -------------- #
# ---------------------------------------------- #

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sadx/.oh-my-zsh"

# Theme
ZSH_THEME="theunraveler"

# Disables auto updates
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

source $ZSH/oh-my-zsh.sh


# ---------------------------------------------- #
# --------------- Configs ---------------------- #
# ---------------------------------------------- #

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
#HISTFILE=~/.cache/zsh/history

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Sets shell default editor to vim
EDITOR=/usr/bin/vim
VISUAL=/usr/bin/vim

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Paths
export PATH="/home/sadx/.gem/ruby/2.6.0/bin:$PATH"

# Open ranger with ctrl+o
bindkey -s '^o' 'ranger\n'
bindkey '^R' history-incremental-search-backward
# ---------------------------------------------- #
# --------------- Plugins ---------------------- #
# ---------------------------------------------- #
plugins=(git vi-mode extract)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh