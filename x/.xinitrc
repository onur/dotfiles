#!/bin/sh

xrandr --dpi 96
xsetroot -solid '#333333'
xset r rate 250 50
xset m 2 10
setxkbmap tr alt
nvidia-settings -a InitialPixmapPlacement=2
nvidia-settings -a GlyphCache=1
xrdb -o < ~/.Xdefaults

# qt5 style
export QT_STYLE_OVERRIDE=GTK+

# gtk3 scrolling overlay sucks so hard
export GTK_OVERLAY_SCROLLING=0

# avoid screen tearing
export __GL_YIELD="USLEEP"

exec i3
