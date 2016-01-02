#!/bin/sh

xrandr --dpi 96
xsetroot -solid '#333333'
xset r rate 250 50
xset m 2 10
setxkbmap tr alt
nvidia-settings -a InitialPixmapPlacement=0
xrdb -o < ~/.Xdefaults

# gpg-agent
envfile="$HOME/.gnupg/gpg-agent.env"
if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
    eval "$(cat "$envfile")"
else
    eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
fi
export GPG_AGENT_INFO  # the env file does not contain the export statement
export SSH_AUTH_SOCK   # enable gpg-agent for ssh

# qt5 style
export QT_STYLE_OVERRIDE=GTK+

# gtk3 scrolling overlay sucks so hard
export GTK_OVERLAY_SCROLLING=0

# avoid screen tearing
export __GL_YIELD="USLEEP"

exec i3
