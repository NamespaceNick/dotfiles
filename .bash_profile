#!/usr/bin/env bash
# Bash configuration for all machines

# Prevents duplicates in path
function prepend_path() {
  [[ ":$PATH:" != *":$1:"* ]] && PATH=$1:$PATH
}

function append_path() {
  [[ ":$PATH:" != *":$1:"* ]] && PATH=$PATH:$1
}
###########################################################################
#                           TOP-LEVEL                                     #
###########################################################################
# PATH
prepend_path $HOME/bin

export EDITOR="vim"

# Ensure new dotfiles are updated
# Bash settings
shopt -s histappend
shopt -s nocaseglob
shopt -s cdspell
HISTSIZE=-1

# `ls` colors
  # Directories blue # Executables red
  # Symlinks purple
if [[ "$OSTYPE" == "darwin"* ]]; then
  export CLICOLOR=1
  export LSCOLORS=gxfxhxDxbxhxhxhxhxcxcx
else
  LS_COLORS=$LS_COLORS:'di=4;34:ex=0;31:' ; export LS_COLORS
fi

# italics for terminal
export TERM=xterm-256color-italic

# Source necessary files
declare -a sourcing=(
#                     ".path"                     # Path configuration
#                     ".bash_prompt"              # Bash prompt
                      ".extra"                    # Misc configurations
                      ".profile"                  # Command prompt
                      ".aliases"                  # Bash aliases
                      ".bash_functions"           # Bash functions
                    )

for file in "${sourcing[@]}"
do 
  source ~/"$file"
done


###########################################################################
#                             PLUGINS                                     #
###########################################################################

if [ -f ~/.bash-git-prompt/gitprompt.sh ] ; then
	GIT_PROMPT_ONLY_IN_REPO=1
	source ~/.bash-git-prompt/gitprompt.sh
fi



# Final processes
prepend_path "$HOME/.cargo/bin"

# Added by Caenbrew.
prepend_path "$HOME/.local/bin"
export LD_RUN_PATH="$HOME/.local/lib:$LD_RUN_PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
