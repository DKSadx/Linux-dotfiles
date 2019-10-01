numlockx &
exec i3
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
dunst > /dev/null 2>&1 &
