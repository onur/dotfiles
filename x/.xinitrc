#!/bin/sh

xrandr --dpi 96
xrandr \
    --output DP-0 --primary --mode 2560x1440 --pos 0x0 --rotate normal \
    --output DP-1 --off \
    --output DP-2 --mode 1920x1080 --pos 2560x0 --rotate normal --rate 144.0 \
    --output DP-3 --off \
    --output DP-4 --off \
    --output DP-5 --off \
    --output HDMI-0 --off
#xrandr --output DP-0 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --mode 1920x1080 --pos 2560x180 --rotate normal --output DP-3 --off --output HDMI-0 --off --output DP-4 --off --output DP-5 --off
#xrandr \
#    --output DP-0 --rate 144.0 --mode 1920x1080 --pos 0x740 --rotate normal \
#    --output DP-1 --off \
#    --output DP-2 --mode 2560x1440 --pos 3360x0 --rotate left \
#    --output DP-3 --off \
#    --output HDMI-0 --off \
#    --output DP-4 --primary --mode 2560x1440 --pos 1920x0 --rotate left \
#    --output DP-5 --off


# qt5 style
export QT_STYLE_OVERRIDE=GTK+

# gtk3 scrolling overlay sucks so hard
export GTK_OVERLAY_SCROLLING=0

# avoid screen tearing
export __GL_YIELD="USLEEP"

xsetroot -solid '#333333'
xset r rate 250 50
xset m default
setxkbmap tr alt
nvidia-settings -a InitialPixmapPlacement=2
nvidia-settings -a GlyphCache=1
xrdb -o < ~/.Xdefaults
VBoxClient --clipboard

# Pause tusunu insert yap
xmodmap -e 'keycode 127=Insert'



if [ -n "$DESKTOP_MATE" ]; then
    exec dbus-run-session mate-session
else
    exec dbus-run-session i3
fi
