export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

fpath+=$HOME/.zsh/typewritten
autoload -U promptinit; promptinit
prompt typewritten

# aliases
alias c='clear'
alias v='nvim'
alias g='git'
alias untar='tar -xzvf $1'
alias ls="exa"

alias reload='source $HOME/.zshrc'

# paths
path+='/opt/homebrew/bin' # homebrew
path+='$HOME/.cargo/bin' # rust
path+='$HOME/go/bin' # go

plugins=(
  brew
  docker
  git
  golang
  node
  npm
  nvm
  rust
  tmux
  zsh-vi-mode
  zsh-interactive-cd
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
