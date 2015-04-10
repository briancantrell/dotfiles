# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Base16 Shell
#OPTIONS: http://chriskempson.github.io/base16
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
#BASE16_SHELL="$HOME/.config/base16-shell/base16-railscasts.dark.sh"


[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH="$HOME/.rbenv/shims:$HOME/bin:$PATH"
eval "$(rbenv init -)"

bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

function deploy(){cap deploy -S rails_env="staging" -S branch=$@}
export EDITOR="vim"

#export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"


# unix
alias tmux="TERM=screen-256color-bce tmux"
alias tlf="tail -f"
alias ln='ln -v'
alias mkdir='mkdir -p'
alias l='ls'
alias ll='ls -al'
alias lh='ls -Alh'

# git
# alias git="hub"
alias g="git"

#rails
alias migrate="rake db:migrate && rake db:test:prepare"

alias spec="spring rspec"
alias ks="ps aux | grep spring | awk '{print $2}' | xargs kill -9"

# Bundler
alias b="bundle"
alias be="bundle exec"

# postgres
alias postgres_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias postgres_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias postgres_status="pg_ctl -D /usr/local/var/postgres status"
alias postgres_log="tlf /usr/local/var/postgres/server.log"

alias ngrok="ngrok -authtoken QumiCncE2s7JaLrsD3Oz"

alias flush_dns="dscacheutil -flushcache"
alias edit_dns="vim /etc/hosts"

alias tml="tmux list-sessions"
alias tmd="tmux detach"
alias tma="tmux -2 attach -t $1"
alias tmk="tmux kill-session -t $1"
source ~/.bin/tmuxinator.zsh



### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
eval "$(direnv hook zsh)"


_ag() {
  if (( CURRENT == 2 )); then
    compadd $(cut -f 1 .git/tags tmp/tags tags 2>/dev/null | grep -v '!_TAG')
  fi
}

compdef _ag ag

