#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


xrdb -load  $HOME/.Xresources &
hsetroot -solid '#cccccc' &
compton &
redshift &
udiskie &
xsetroot -cursor_name left_ptr &
rm /tmp/$(ls /tmp | grep bspwm)
dropbox &
sxhkd -m -1 &
exec bspwm 

# exec xmonad
# exec gnome-session
#exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
