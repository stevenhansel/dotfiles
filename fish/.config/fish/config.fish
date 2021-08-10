###########################################################
# GENERAL
###########################################################

# Disable fish initial greeting
set fish_greeting ""

# Set xterm-256 color
set -gx TERM xterm-256color

# Set default editor to be always neovim
set -gx EDITOR nvim

# Set vim keybindings for Fish terminal
fish_vi_key_bindings

# Prefer: exa over ls
if type -q exa
  alias l='exa -Gl --icons'
  alias ls='exa -G --icons'
  alias la='exa -Ga --icons'
end

# Prefer: nvim over vim
if type -q nvim
  alias vim='nvim'
end


###########################################################
# PATHS 
###########################################################

# Set Homebrew Path exclusive to M1 Chip
set -u fish_user_paths /opt/homebrew/bin $fish_user_paths

# Rust Cargo
set -u fish_user_paths /Users/shinteimai/.cargo/bin $fish_user_paths

###########################################################
# ALIASES 
###########################################################

# General
alias c='clear'
alias v='nvim'
alias g='git'
alias p='ping -c 5'
alias untar='tar -xzvf $1'
alias getpass="openssl rand -base64 20"

# Workspaces
alias dotfiles='cd ~/.dotfiles'

# youtube-dl
alias dl='youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio" --merge-output-format mp4 $1'
alias dlmp3='youtube-dl --extract-audio --audio-format mp3 $1'

# IP Address
alias ipi='ipconfig getifaddr en0'
alias ipe='curl ifconfig.me'

# Docker
alias dip='docker image prune'
alias dls='docker ps'
alias dlsa='docker ps -a'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcdv='docker-compose down -v'

# PostgreSQL
alias pdbu='brew services start postgresql'
alias pdbd='brew services stop postgresql'

# Redis
alias rdbu='brew services start redis'
alias rdbd='brew services stop redis'

# MongoDB
alias mdbu='brew services start mongodb-community'
alias mdbd='brew services stop mongodb-community'

# IDE script to initialize a coding environment
alias ide='bash $HOME/scripts/ide.sh'

# Reload fish config script
alias reload='source $HOME/.config/fish/config.fish'

# Python
alias python='python3'
alias pip='pip3'

###########################################################
# THEME 
###########################################################

set -g theme_display_git yes
set -g theme_display_git_dirty no
set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose no
set -g theme_display_git_dirty_verbose no
set -g theme_display_git_stashed_verbose no
set -g theme_display_git_default_branch yes
set -g theme_git_default_branches master main
set -g theme_use_abbreviated_branch_name yes
set -g theme_display_hg yes
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_vi yes
set -g theme_display_date no
set -g theme_display_cmd_duration no
set -g theme_title_display_process no 
set -g theme_title_display_path no
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path yes
set -g theme_date_format "+%a %H:%M"
set -g theme_date_timezone Asia/Jakarta 
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_display_jobs_verbose yes
set -g default_user your_normal_user
set -g theme_color_scheme dark
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_newline_prompt '$ '
