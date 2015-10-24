# onur bash aliases

# list
alias l='ls'
alias ll='ls -l'
alias la='ls -a'

# programlar
alias py='python'
alias py3='python3'
alias sc='screen'
alias l2='links2 -g'
alias le='less'
alias rsync='rsync -av'

# sudo
alias aptitude='sudo aptitude'

# ssh
alias ssh-domus='ssh domus.onur.im'
alias ssh-insitus='ssh insitus.onur.im'
alias ssh-vpn='ssh vpn.onur.im'
alias ssh-i='ssh i.onur.im'

# cesitli
alias imzala='gpg -bas'
alias bellek='ps aux | awk '\''{sum +=$4}; END {print sum}'\'''
alias most-used-commands='awk '\''{print $1}'\'' ~/.bash_history | sort | uniq -c | sort -rn | head -n 10'

# alio only aliases
if [ $(hostname) = "csa" ]; then
  alias shutdown='sudo shutdown -hP now'
  #alias suspend-mem='sudo s2ram'
  alias suspend-mem='echo mem | sudo tee /sys/power/state'
  alias suspend-disk='sudo s2disk'
  alias suspend-disk-reboot='sudo s2disk -P "shutdown method = reboot"'
  alias reboot='sudo shutdown -r now'

  alias screenshot='import -window root screen.png'
  alias monitorukapat='xset dpms force off'

  # openvpn
  alias openvpn="sudo openvpn ~/code/vpn/config/desktop/vpn.conf > /dev/null 2>&1 & disown"

  # programlar background
  #alias iceweasel='chroot iceweasel-sid iceweasel > /dev/null 2>&1 & disown'
  alias iceweasel='iceweasel > /dev/null 2>&1 & disown'
  #alias chromium='chromium --proxy-server=192.168.1.1:3128 > /dev/null 2>&1 & disown'
  #alias chromium-noproxy='chromium > /dev/null 2>&1 & disown'
  alias chromium='chromium > /dev/null 2>&1 & disown'
  #alias chromium='chromium --proxy-server=10.8.0.1:3128 > /dev/null 2>&1 & disown'
  #alias chromium='sh ~/code/chromium/chromium.sh > /dev/null 2>&1 & disown'
  alias x='startx -- -dpi 96 > /dev/null 2>&1 & disown && exit'
  alias gimp='gimp > /dev/null 2>&1 & disown'
  alias chroot='~/code/chroot/chroot'

  # wine and wine cmds
  alias wine='~/code/chroot/wine'
  alias wow='wine wow > /dev/null 2>&1 & disown'
  alias wow='wine wowcata > /dev/null 2>&1 & disown'
  alias steam='wine steam > /dev/null 2>&1 & disown'

  # programlar
  alias mp='mplayer'
  alias mpn='mplayer -nocache'
  alias mpv='mplayer -vo null'
  alias mpvn='mplayer -vo null -nocache'
  alias mocp='mocp'

  # domustaki programlar
  alias irssi='ssh-domus -t screen -dr irssi'
  alias rtorrent='ssh-domus -t screen -dr rtorrent'
  alias mutt='ssh-domus -t mutt'

  # vim without plugins
  alias vi='vim -N --noplugin -i NONE'

  # todo
  alias t=$HOME/.todo/todo.sh

  # gource
  alias gource='gource -s 0.5 --auto-skip-seconds 0.1'
fi


# domus only aliases
#if [ $(hostname) == "domus" ]; then
#  alias m='sc mutt'
#  alias torrentindir='wget -P ~/.torrent/'
#  alias irssi='sc irssi'
#fi

# obsolete
#alias pss='ps axv | grep -v ]$'
#alias no='~/code/no.sh'
#alias iceweasel-sid='sudo /opt/chroot iceweasel su onur -c "iceweasel -no-remote"> /dev/null 2>&1 & disown'
#alias soncache='find ~/.cache/chromium/Default/Cache/ | sort -r | head -n 15 | xargs file | sort'
#


# vpn
alias vpn='ssh -f -N -D 9999 -p 15400 evo-master.onur.im'

alias reverse='~/reverse-master/reverse.py'
