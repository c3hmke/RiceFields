#----------------------------------------------------------------------------------------------------------------------#
#                                                       PATH                                                           #
#----------------------------------------------------------------------------------------------------------------------#
export PATH="$PATH:$HOME/.local/bin"                             # Home/.local
export PATH="$PATH:$HOME/.dotnet/tools"                          # .NET tools
export PATH="$PATH:$HOME/.opencode/bin"                          # Opencode shell tool

export NVM_DIR="$HOME/.nvm"                                      # Node Version Manager
[ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"

export PATH="$PATH:/opt/Rider/bin"
export PATH="$PATH:/opt/DataGrip/bin"
export PATH="$PATH:/opt/WebStorm/bin"

#----------------------------------------------------------------------------------------------------------------------#
#                                                       PROMPT                                                         #
#----------------------------------------------------------------------------------------------------------------------#
# Prompt configuration
eval "$(oh-my-posh init zsh --config $HOME/.config/shell/omp.yml)"                       # oh-my-posh w/ settings

# Navigational settings
bindkey -e                                                                               # use emacs key bindings
autoload -Uz compinit                                                                    # modern tab completion
zstyle ':completion:*' menu select                                                       # allow drop into completion

bindkey '^[[A' history-substring-search-up                                               # history substr search prior
bindkey '^[[B' history-substring-search-up                                               # history substr search latter

# History options
export HISTFILE="$HOME/.cache/zsh/.zsh_history"                                          # store history in cache dir
setopt histignorealldups                                                                 # ignore duplicates in history
HISTSIZE=10000                                                                           # history in memory
SAVEHIST=10000                                                                           # history on disk

#----------------------------------------------------------------------------------------------------------------------#
#                                                    ZSH PLUGINS                                                       #
#----------------------------------------------------------------------------------------------------------------------#
source $HOME/.config/shell/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh           # syntax highlighting
source $HOME/.config/shell/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh                   # auto-suggest commands
source $HOME/.config/shell/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh # history w/ substring
source $HOME/.config/shell/plugins/zsh-completions/zsh-completions.plugin.zsh                    # git auto completion

#----------------------------------------------------------------------------------------------------------------------#
#                                                      ALIASES                                                         #
#----------------------------------------------------------------------------------------------------------------------#
# General
alias ..="cd .."
alias ...="cd ..."
alias c="clear"
alias h="history"
alias ll="ls -l"
alias la="ls -la"
alias path="echo $PATH | tr ':' '\n'"
alias python="python3"

# Networking
alias ports="lsof -i -P -n | grep LISTEN"
alias myip="curl ifconfig.me"

# Docker
alias d="docker"
alias dc="docker compose"
alias dps="docker ps"

# C# / .NET
alias dn="dotnet"
alias dnr="dotnet restore"
alias dng="dotnet aspnet-codegenerator"

# PHP / Laravel
alias a="php artisan"
alias as="php artisan serve"
alias serve="php -S localhost:8000"

# Git
alias g="git"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"
alias gt="git status"
alias gb="git branch"
alias go="git checkout"
alias gf="git fetch -p"
alias gp="git pull"
alias gu="git push"
alias ga="git add"
alias gc="git commit"

#----------------------------------------------------------------------------------------------------------------------#
#                                                      METHODS                                                         #
#----------------------------------------------------------------------------------------------------------------------#
tgedit() {                                                                              # toggles edit permissions for
  local file="${ZDOTDIR:-$HOME}/.zshrc"                                                 # the rc file to prevent pranks
  if [ -w "$file" ]; then
    chmod 444 "$file"
  else
    chmod 644 "$file"
  fi
}

mkcd() {                                                                                # Create a dir and cd into it 
  mkdir -p "$1" && cd "$1" 
}

psg() {                                                                                 # find a process
  ps aux | grep -i "$1" | grep -v grep  
}
