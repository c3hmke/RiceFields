# These exports will run before loading the .zshrc profile

export PATH="$HOME/bin:$PATH"                                    # Home
export PATH="$HOME/.local/bin:$PATH"                             # Home/.local
export PATH="/srv/bitgit.bit.nl/baceinabox/bin:$PATH"            # BACE-in-a-BOX
export PATH="/opt/flutter/bin:$PATH"                             # Flutter
export PATH="$PATH:$HOME/.dotnet/tools"                          # .NET tools
export PATH=/home/caius/.opencode/bin:$PATH                      # Opencode shell tool

export NVM_DIR="$HOME/.nvm"                                      # Node Version Manager
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
