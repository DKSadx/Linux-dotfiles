#!/bin/bash
rm -r ~/Documents/backup/dotfiles/i3
rm -r ~/Documents/backup/dotfiles/polybar
rm -r ~/Documents/backup/dotfiles/rofi
rm -r ~/Documents/backup/dotfiles/sublime-text-3
rm -r ~/Documents/backup/dotfiles/My_scripts
rm -r ~/Documents/backup/dotfiles/compton

mkdir ~/Documents/backup/dotfiles/compton
mkdir ~/Documents/backup/dotfiles/sublime-text-3
cp -r ~/.config/i3 ~/Documents/backup/dotfiles/
cp -r ~/.config/polybar ~/Documents/backup/dotfiles/
cp -r ~/.config/rofi ~/Documents/backup/dotfiles/
cp -r ~/.config/sublime-text-3/"Installed Packages" ~/Documents/backup/dotfiles/sublime-text-3
cp -r ~/.config/sublime-text-3/"Packages" ~/Documents/backup/dotfiles/sublime-text-3
rsync -av --progress ~/My_scripts ~/Documents/backup/dotfiles/ --exclude 'i3-gaps'
cp ~/.config/compton.conf ~/Documents/backup/dotfiles/compton
cp ~/.bashrc ~/Documents/backup/dotfiles/
cp ~/.bash_profile ~/Documents/backup/dotfiles/
cp ~/.Xdefaults ~/Documents/backup/dotfiles/
