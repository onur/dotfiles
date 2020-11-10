source $HOME/dotfiles/zsh/antigen/antigen.zsh
source $HOME/.profile
source $HOME/.bash_aliases

# Disable link escape
DISABLE_MAGIC_FUNCTIONS=true

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle kubectl
#antigen bundle heroku
#antigen bundle pip
#antigen bundle lein
antigen bundle command-not-found

antigen bundle history-substring-search
antigen bundle colored-man-pages

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting



# Load the theme.
antigen theme agnoster

# Tell Antigen that you're done.
antigen apply


if [ $(hostname) = "home" ] && [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
