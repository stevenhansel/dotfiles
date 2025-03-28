plugins=(
  brew
  git
  docker
  tmux
  zsh-vi-mode
  zsh-interactive-cd
  zsh-autosuggestions
  zsh-syntax-highlighting
)

###
#
# Exports
#
###

ZSH_THEME="typewritten"

export ZSH="$HOME/.oh-my-zsh"
export PYENV_ROOT="$HOME/.pyenv"
export NVM_DIR="$HOME/.nvm"
export _JAVA_AWT_WM_NONREPARENTING=1
export LDFLAGS="-L/opt/homebrew/opt/avr-gcc@12/lib"
export PATH="/opt/homebrew/opt/avr-gcc@12/bin:$PATH"

###
# Aliases
###

alias kubectl="k0s kubectl"

# General aliases
alias c="clear"
alias v="nvim"
alias untar="tar -xzvf $1"
alias unzip="unzip $1"
alias ls="exa"
# alias cat="bat"
alias reload="source $HOME/.zshrc"

# Git aliases
alias g="git"
alias gs="git status"
alias ga="git add ."
alias gl="git pull"
alias gp="git push"
alias gpo="git push -u origin $1"
alias gpf="git push -f"
alias gr="git rebase -i $1"

# Tmux aliases
alias t="tmux new"
alias ta="tmux attach -t $1"
alias tl="tmux list-sessions"
alias tr="tmux kill-session -t $1"
alias tk="tmux kill-session"

# Scripts
alias ide='$HOME/Scripts/ide.sh'
alias idev='$HOME/Scripts/idev.sh'

alias dty-services='$HOME/Scripts/dty_services.sh'
alias dty-sdks='$HOME/Scripts/dty_sdks.sh'
alias dty-devops='$HOME/Scripts/dty_devops.sh'

###
#
# Paths
#
###
if [[ $(uname) == "Darwin" ]]; then
  path+='/opt/homebrew/bin'
fi

path+="/opt/nvim-linux64/bin"

path+="$HOME/.cargo/bin"
path+="$HOME/.local/share/pypoetry/venv/bin"
path+="/usr/local/go/bin"
path+="$HOME/anaconda3/bin"

command -v pyenv >/dev/null 
path+="$PYENV_ROOT/bin"

###
#
# Sourcing
#
###
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

eval "$(rbenv init - zsh)"
eval "$(pyenv init -)"

source $ZSH/oh-my-zsh.sh

fpath=($fpath "/Users/shinteimai/.zfunctions")

# Load Angular CLI autocompletion.
source <(ng completion script)

# add Pulumi to the PATH
export PATH=$PATH:/home/steffe/.pulumi/bin
