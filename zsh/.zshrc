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
alias g="git"
alias d="docker"
alias dn="dotnet"
alias dng="dotnet aspnet-codegenerator"

#----------------------------------------------------------------------------------------------------------------------#
#                                                      METHODS                                                         #
#----------------------------------------------------------------------------------------------------------------------#
tgedit() {				                                                                # toggles edit permissions for
  local file="${ZDOTDIR:-$HOME}/.zshrc"                                                 # the rc file to prevent pranks
  if [ -w "$file" ]; then
    chmod 444 "$file"
  else
    chmod 644 "$file"
  fi
}
