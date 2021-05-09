# Read man pages with bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# Mouse scroll won't work in bat without this
export BAT_PAGER="less -RF"
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" '
# Sets shell default editor to neovim
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

# ---------------------------------------------- #
# --------------- Aliases ---------------------- #
# ---------------------------------------------- #
# Clear all package cache but last version
alias clearCache='paccache -rk1'
# Neovim
alias nv='nvim'
alias vim='nvim'
# Neovim config
alias vrc='nvim .config/nvim/init.vim'
alias zrc='vim ~/.zshrc'
alias szrc='source ~/.zshrc'
alias ll='ls -lGFh'
alias ls='ls -GF'
# Moves file into trash-bin instead deleting it
alias rm='trash-put'
# Shows man in pdf
alias manp=manToPdf
alias ipi='ipconfig getifaddr en0'
# Shows external IP address
alias ipe='curl ipinfo.io/ip'
# Untar tar files
alias untar='tar -zxvf'
# Color cat - print file with syntax highlighting.
alias ccat="highlight --out-format=ansi"
# Download youtube mp3 file
alias yta=ytAudio
# Download youtube video file
alias ytv=ytVideo
alias c='clear'
alias pac='sudo pacman -S'
alias pacR='sudo pacman -Rns'
# Launching python in tty
alias py='python3'
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
alias copy="tr -d '\n' | xclip -sel clip"
alias pc="pwd | copy"
# Cd to dotfiles git directory
alias cdL='cd ~/Documents/backup/Linux-dotfiles'

#--- GIT ---
# Git diff in neovim
alias gdif='nvim -c "Gdiff"'
alias gitA='git add'
alias gitC='git commit -m'
alias gitP='git push origin'

#--- Kubernetes ---
alias k='kubectl'
alias kc='kubectl'
alias kgp='kubectl get pods'
alias kgn='kubectl get nods'
alias kgd='kubectl get deployment'
alias kdp='kubectl describe pod'
alias kdd='kubectl describe deployment'
alias kgs='kubectl get svc'
alias kds='kubectl describe svc'


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

# ---------------------------------------------- #
# --------------- Oh-my-zsh stuff -------------- #
# ---------------------------------------------- #

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sadx/.oh-my-zsh"

# Theme
ZSH_THEME="theunraveler"
#ZSH_THEME="robbyrussell"

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
bindkey '^R' history-incremental-search-backward
# Fixes bug where you can't delete in insert mode
bindkey "^?" backward-delete-char
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
# For cursor shapes and blinking effects refer to this https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] ||
		 [[ $1 = 'block' ]]; then
		echo -ne '\e[2 q'
	elif [[ ${KEYMAP} == main ]] ||
			 [[ ${KEYMAP} == viins ]] ||
			 [[ ${KEYMAP} = '' ]] ||
			 [[ $1 = 'beam' ]]; then
		echo -ne '\e[6 q'
	fi
}
zle -N zle-keymap-select
zle-line-init() {
		zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
		echo -ne "\e[6 q"
}
zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Sets shell default editor to neovim
EDITOR=/usr/bin/nvim
VISUAL=/usr/bin/nvim

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Open ranger with ctrl+o
bindkey -s '^o' 'ranger\n'
bindkey '^R' history-incremental-search-backward
# ---------------------------------------------- #
# --------------- Plugins ---------------------- #
# ---------------------------------------------- #
plugins=(git vi-mode extract zshautosuggestions)
# Enables git plugin and places the branch name to the right side
autoload -Uz compinit && compinit
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
