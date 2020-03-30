#!/bin/bash

msg="ENG -> BOS"
options="1 = ENG -> BOS/CRO/GER
2 = BOS -> ENG
3 = Identify language -> ENG
4 = Identify language -> BOS/CRO/GER
0 = Check spelling (ENG)"
option="$(echo "$options" | rofi -dmenu -theme Nebula -p "$msg")"

case $option in

  "1 = ENG -> BOS/CRO/GER" | "1")
    msg="ENG -> BOS/CRO/GER"
    word="$(rofi -dmenu -theme Nebula -p "$msg")"
    trans -b -from english -to bosnian+croatian+german $word | perl -pe 's/\e\[?.*?[\@-~]//g' | awk 'BEGIN{ RS = "" ; FS = "\n" }{print $1 "\n" $2 "\n"$3}' | rofi -dmenu -theme Nebula -p "$word" | xsel -i -b
    ;;

  "2 = BOS -> ENG" | "2")
    msg="BOS -> ENG"
    word="$(rofi -dmenu -theme Nebula -p "$msg")"
    trans -b -from bosnian -to english $word | perl -pe 's/\e\[?.*?[\@-~]//g' | awk 'BEGIN{ RS = "" ; FS = "\n" }{print $1}' | rofi -dmenu -theme Nebula -p "$word" | xsel -i -b
    ;;

  "3 = Identify language -> ENG" | "3")
    msg="X -> ENG"
    word="$(rofi -dmenu -theme Nebula -p "$msg")"
    trans -b -to english $word | perl -pe 's/\e\[?.*?[\@-~]//g' | awk 'BEGIN{ RS = "" ; FS = "\n" }{print $1}' | rofi -dmenu -theme Nebula -p "$word" | xsel -i -b
    ;;

  "4 = Identify language -> BOS/CRO/GER" | "4")
    msg="X -> BOS/CRO/GER"
    word="$(rofi -dmenu -theme Nebula -p "$msg")"
    trans -b -to bosnian+croatian+english $word | perl -pe 's/\e\[?.*?[\@-~]//g' | awk 'BEGIN{ RS = "" ; FS = "\n" }{print $1 "\n" $2 "\n"$3}' | rofi -dmenu -theme Nebula -p "$word" | xsel -i -b
    ;;

  "0 = Check spelling (ENG)" | "0")
    msg="Check spelling"
    word="$(rofi -dmenu -theme Nebula -p "$msg")"
    trans -b -from english -to english $word | perl -pe 's/\e\[?.*?[\@-~]//g' | awk 'BEGIN{ RS = "" ; FS = "\n" }{print $1}' | rofi -dmenu -theme Nebula -p "$word" | xsel -i -b
    ;;

  "")
    ;;

  *)
    trans -b -from english -to bosnian $option | perl -pe 's/\e\[?.*?[\@-~]//g' | awk 'BEGIN{ RS = "" ; FS = "\n" }{print $1}' | rofi -dmenu -theme Nebula -p "$option" | xsel -i -b
    ;;
esac
