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
alias gs='gst'

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
alias password-generator="tr -cd '[:alnum:]' < /dev/urandom | fold -w32 | head -n1"

# calendar
alias cal='ncal -M -3 -wb'

# nc aliases
alias kcnc='export KUBECONFIG=$(ncc kubeconfig)'
alias n='ncc'

# xorg only aliases
if [ -f "$HOME/.xinitrc" ]; then
  alias shutdown='sudo shutdown -hP now'
  alias suspend-mem='echo mem | sudo tee /sys/power/state'
  alias suspend-disk='sudo s2disk'
  alias suspend-disk-reboot='sudo s2disk -P "shutdown method = reboot"'
  alias reboot='sudo shutdown -r now'

  alias screenshot='import -window root screen.png'
  alias monitorukapat='xset dpms force off'

  # openvpn
  alias openvpn="sudo openvpn ~/code/vpn/config/desktop/vpn.conf > /dev/null 2>&1 & disown"

  # programlar
  alias mp='mplayer'
  alias mpn='mplayer -nocache'
  alias mocp='mocp'

  # todo
  alias t=$HOME/.todo/todo.sh

  # gource
  alias gource='gource -s 0.5 --auto-skip-seconds 0.1'

  alias xclip='xclip -r -selection clipboard'
fi

