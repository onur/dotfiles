# onur bash aliases

# programlar
alias rsync='rsync -av'
alias gs='gst'

# cesitli
alias imzala='gpg -bas'
alias password-generator="tr -cd '[:alnum:]' < /dev/urandom | fold -w32 | head -n1"

# calendar
alias cal='ncal -M -3 -wb'

# nc aliases
alias kcnc='export KUBECONFIG=$(ncc kubeconfig)'
alias n='ncc'

# xorg only aliases
if [ -f "$HOME/.xinitrc" ]; then
  alias monitorukapat='xset dpms force off'
  alias xclip='xclip -r -selection clipboard'
fi

