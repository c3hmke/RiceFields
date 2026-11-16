
#----------------------------------------------------------------------------------------------------------------------#
#                                                       PATH                                                           #
#----------------------------------------------------------------------------------------------------------------------#
export PATH="$PATH:$HOME/.local/bin"                             # Home/.local
export PATH="$PATH:$HOME/.dotnet/tools"                          # .NET tools
export PATH="$PATH:$HOME/.opencode/bin"                           # Opencode shell tool

export PATH="$HOME/.asdf/shims:$PATH"                             # asdf shims (Node, etc.) take precedence

#----------------------------------------------------------------------------------------------------------------------#
#                                                       PROMPT                                                         #
#----------------------------------------------------------------------------------------------------------------------#
eval "$(oh-my-posh init zsh --config "$(brew --prefix oh-my-posh)/themes/mytheme.yml")"

#----------------------------------------------------------------------------------------------------------------------#
#                                                    ZSH SETTINGS                                                      #
#----------------------------------------------------------------------------------------------------------------------#
bindkey -e                                                                                # Emacs key bindings

# History
export HISTFILE="$HOME/.cache/zsh/.zsh_history"
setopt histignorealldups
HISTSIZE=10000
SAVEHIST=10000

#----------------------------------------------------------------------------------------------------------------------#
#                                                    ZSH PLUGINS                                                       #
#----------------------------------------------------------------------------------------------------------------------#
FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"                                     # Homebrew completions
zstyle ':completion:*' menu select                                                        # Completion configuration
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh                   # Autocomplete + compinit
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh  # History substring search

# History navigation
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Syntax highlighting (load last)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
alias artisan="php artisan"
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

gprune() {
  git fetch --prune &&
  git for-each-ref --format='%(refname:short) %(upstream:track)' refs/heads |
    awk '$2 == "[gone]" {print $1}' |
    xargs -r git branch -d
}

#----------------------------------------------------------------------------------------------------------------------#
#                                                      METHODS                                                        #
#----------------------------------------------------------------------------------------------------------------------#
mkcd() {
  mkdir -p "$1" && cd "$1"
}

psg() {
  ps aux | grep -i "$1" | grep -v grep
}

switchphp() {
  brew unlink php
  brew link --force --overwrite php@$1

  export PATH="/opt/homebrew/opt/php@$1/bin:$PATH"
  export PATH="/opt/homebrew/opt/php@$1/sbin:$PATH"

  source ~/.zshrc
  php -v
}
