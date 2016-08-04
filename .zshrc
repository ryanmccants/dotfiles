# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ryan/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall
TERM=xterm
export EDITOR="nvim"
alias ls="ls --color --group-directories-first"

# Python Virtualenv config
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

# Ruby gems path
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# Anaconda alias
alias conda="~/anaconda3/bin/conda"

# Cabal for Haskell
PATH=$PATH:~/.cabal/bin
PATH=$PATH:.cabal-sandbox/bin

# Lemonbar
export XDG_CONFIG_HOME="$HOME/.config"
PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=24
PANEL_FONT="-*-fixed-*-*-*-*-10-*-*-*-*-*-*-*"
PANEL_WM_NAME=bspwm_panel
export PANEL_FIFO PANEL_HEIGHT PANEL_FONT PANEL_WM_NAME

# source /usr/share/doc/pkgfile/command-not-found.zsh

function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

