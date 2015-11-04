#!/bin/sh

xrandr --dpi 96
xsetroot -solid '#000000'
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


exec i3
