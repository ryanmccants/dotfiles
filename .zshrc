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

eval "$(starship init zsh)"
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

alias k=kubectl
alias vim=nvim
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)


# Added by Antigravity CLI installer
export PATH="/home/ryan/.local/bin:$PATH"
export PATH="/home/ryan/.local/bin:$PATH"

# Load machine-specific configuration if it exists
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
