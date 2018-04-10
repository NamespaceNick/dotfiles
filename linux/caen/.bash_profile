#!/usr/bin/env bash
# Bash configuration for all machines

###########################################################################
#                        NECESSARY FUNCTIONS                              #
###########################################################################

pathappend() {
  for ARG in "$@"
  do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
      PATH="${PATH:+"$PATH:"}$ARG"
    fi
  done
}

pathprepend() {
  for ((i=$#; i>0; i--))
  do
    ARG=${!i}
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
      PATH="$ARG${PATH:+":$PATH"}"
    fi
  done
}
###########################################################################
#                           TOP-LEVEL                                     #
###########################################################################
# PATH
pathprepend $HOME/bin
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

# Source necessary files
declare -a sourcing=(
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

GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh



# Final processes
pathprepend $HOME/.cargo/bin

# Added by Caenbrew.
pathprepend $HOME/.local/bin
export LD_RUN_PATH="$HOME/.local/lib:$LD_RUN_PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
