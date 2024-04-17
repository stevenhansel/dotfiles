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
export ANDROID_HOME="$HOME/Android/Sdk"
export TURTLEBOT3_MODEL=waffle
export _JAVA_AWT_WM_NONREPARENTING=1
export NOMAD_ADDR=http://localhost:4646
export VAULT_ADDR=http://127.0.0.1:8200
export LDFLAGS="-L/opt/homebrew/opt/avr-gcc@12/lib"
export PATH="/opt/homebrew/opt/avr-gcc@12/bin:$PATH"

###
# Aliases
###

# General aliases
alias c="clear"
alias v="nvim"
alias e="emacsclient -c -a 'emacs'"
alias emacs="emacsclient -c -a 'emacs'"
alias emacsdaemon="emacs --daemon"
alias untar="tar -xzvf $1"
alias unzip="unzip $1"
alias ls="exa"
# alias cat="bat"
alias dotfiles="cd $HOME/.dotfiles"

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

# Docker aliases
alias dl="docker ps -a"
alias dlq="docker ps -aq"
alias dr="docker stop $1 && docker rm $1"
alias dra="docker stop $(docker ps -aq) && docker rm $(docker ps -aq)"
alias di="docker images"
alias diq="docker images -q"
alias drmi="docker rmi $1"
alias drmia="docker rmi $(docker images -q)"
alias dprune="docker system prune -a"

# Docker compose aliases
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcp="docker compose pull"

alias dcfu="docker compose -f $1 up -d"
alias dcfd="docker compose -f $1 down"
alias dcfp="docker compose -f $1 pull"

# scripts
alias ide='$HOME/Scripts/ide.sh'
alias idev='$HOME/Scripts/idev.sh'
alias sync='$HOME/Scripts/rsync.sh'

###
#
# Paths
#
###
if [[ $(uname) == "Darwin" ]]; then
  path+='/opt/homebrew/bin'
fi

path+="$HOME/.cargo/bin"
path+="$HOME/.local/share/pypoetry/venv/bin"
path+="/usr/local/go/bin"
path+="$HOME/.config/emacs/bin"

path+="$HOME/android-studio/bin"
path+="$ANDROID_HOME/emulator"
path+="$ANDROID_HOME/plaform-tools"

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

if [[ $(uname) != "Darwin" ]]; then
  source /opt/ros/noetic/setup.zsh
  source ~/catkin_ws/devel/setup.zsh
fi


source $ZSH/oh-my-zsh.sh

fpath=($fpath "/Users/shinteimai/.zfunctions")

