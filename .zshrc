# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_pop
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
#

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

source $BASE16_SHELL

# User configuration
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"

export PATH="./bin:$PATH"

bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

export EDITOR="vim"

# alias tmux="TERM=screen-256color-bce tmux"
alias tlf="tail -f"
alias ln='ln -v'
alias mkdir='mkdir -p'
alias l='ls'
alias ll='ls -al'
alias lh='ls -Alh'

alias g="git"

# Bundler
alias b="bundle"
alias be="bundle exec"

alias tml="tmux list-sessions"
alias tmd="tmux detach"
alias tma="tmux -2 attach -t $1"
alias tmk="tmux kill-session -t $1"

_ag() {
  if (( CURRENT == 2 )); then
    compadd $(cut -f 1 .git/tags tmp/tags tags 2>/dev/null | grep -v '!_TAG')
  fi
}

compdef _ag ag

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
# [[ -f /Users/brian/.nvm/versions/node/v9.10.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/brian/.nvm/versions/node/v9.10.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# # tabtab source for sls package
# # uninstall by removing these lines or running `tabtab uninstall sls`
# [[ -f /Users/brian/.nvm/versions/node/v9.10.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/brian/.nvm/versions/node/v9.10.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# # tabtab source for slss package
# # uninstall by removing these lines or running `tabtab uninstall slss`
# [[ -f /Users/brian/.nvm/versions/node/v9.10.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/brian/.nvm/versions/node/v9.10.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
#
# export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(rbenv init - zsh)"
