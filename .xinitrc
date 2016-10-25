#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrdb -merge ~/.Xresources 
xset +fp /usr/share/fonts/local
xset fp rehash

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# use custom keyboard mapping
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#xsetroot -solid black

#exec ratpoison

if [[ $1 == "rat" ]]
then
  xbindkeys
  exec ratpoison
elif [[ $1 == "fvwm" ]]
then
  xbindkeys
  exec fvwm
elif [[ $1 == "i3" ]]
then
  xbindkeys
  exec i3
elif [[ $1 == "evilwm" ]]
then
    exec evilwm
else
  xbindkeys
  exec i3
#  echo "Choose a window manager"
fi
