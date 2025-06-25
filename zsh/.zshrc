#----------------------------------------------------------------------------------------------------------------------#
#                                                       PROMPT                                                         #
#----------------------------------------------------------------------------------------------------------------------#
autoload -Uz promptinit
promptinit

# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#----------------------------------------------------------------------------------------------------------------------#
#                                                      EXPORTS                                                         #
#----------------------------------------------------------------------------------------------------------------------#
export BROWSER="firefox"                                                                    # default browser to use
export HISTFILE="$HOME/.cache/zsh/.zsh_history"                                             # location of HIST file
export PATH="$PATH:$HOME/.local/scripts:$HOME/.local/bin"                                   # PATH for executables
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"                     # history for aut0jump

# Set up NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


#----------------------------------------------------------------------------------------------------------------------#
#                                                    SHELL OPTIONS                                                     #
#----------------------------------------------------------------------------------------------------------------------#
# shell theme
ZSH_THEME=agnoster

# History options
setopt histignorealldups                                                                    # ignore dupes in hist
HISTSIZE=10000                                                                              # history in memory
SAVEHIST=10000                                                                              # history on disk

# key bindings
bindkey -e                                                                                  # use emacs bindings

# Tab completion
autoload -Uz compinit                                                                       # modern tab completion
zstyle ':completion:*' menu select                                                          # drop into completion

#----------------------------------------------------------------------------------------------------------------------#
#                                                    ZSH PLUGINS                                                       #
#----------------------------------------------------------------------------------------------------------------------#
# Load the plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh           # syntax highlighting
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh                   # auto-suggest commands
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh # history with substring
source /usr/share/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh                    # git auto completion

# PowerLevel10K theme
source /usr/share/zsh/powerlevel10k/powerlevel10k.zsh-theme                                 # add powerlevel10k theme

# history-substring-search keybindings
bindkey '^[[A' history-substring-search-up                                                  # up arrow searches earlier
bindkey '^[[B' history-substring-search-up                                                  # down arrow searches later

#----------------------------------------------------------------------------------------------------------------------#
#                                                      ALIASES                                                         #
#----------------------------------------------------------------------------------------------------------------------#
# SYSTEM
alias ll="ls -la"

# BIT
PATH="$PATH:/srv/bitgit.bit.nl/baceinabox/bin"						    # add baceinabox to path
alias b="baceenv"

# DOCKER
alias d="docker"

# DOTNET
PATH="$PATH:$HOME/.dotnet/tools"                              # add dotnet tools to path
alias dn="dotnet"
alias dng="dotnet aspnet-codegenerator"

# GIT
alias g="git"
alias gb="git branch"
alias go="git checkout"
alias gf="git fetch"
alias gp="git pull"
alias gu="git push"
alias gt="git status"
alias ga="git add"
alias gc="git commit"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

