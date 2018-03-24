#!/usr/bin/env bash
# Bash configuration for all machines

###########################################################################
#                           TOP-LEVEL                                     #
###########################################################################
# PATH
export PATH="$HOME/bin:$PATH"
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
#                     ".path"                     # Path configuration
#                     ".bash_prompt"              # Bash prompt
                      ".extra"                    # Misc configurations
                      ".profile"                  # Command prompt
                      ".aliases"                  # Bash aliases
                      ".bash_functions"           # Bash functions
                    )

for file in "${sourcing[@]}"
do
  if [ -e ~/"$file" ]; then
    source ~/"$file"
  else
    echo "MISSING_FILE::~/$file"
  fi
done


###########################################################################
#                             PLUGINS                                     #
###########################################################################

GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh



# Final processes
export PATH="$HOME/.cargo/bin:$PATH";
