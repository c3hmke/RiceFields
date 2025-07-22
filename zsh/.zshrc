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
alias ll="ls -la"
alias b="baceenv"
alias d="docker"

alias dn="dotnet"
alias dng="dotnet aspnet-codegenerator"

alias g="git"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"
alias gt="git status"
alias gb="git branch"
alias go="git checkout"
alias gf="git fetch"
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
