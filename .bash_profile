#!/usr/bin/env bash
# Bash configuration for all machines

###########################################################################
#                           TOP-LEVEL                                     #
###########################################################################
# PATH
export PATH="$HOME/bin:$PATH"

# Bash-it

# Bash settings
shopt -s histappend
shopt -s nocaseglob
shopt -s cdspell

# `ls` colors
  # Directories blue
  # Executables red
LS_COLORS=$LS_COLORS:'di=4;34:ex=0;31:' ; export LS_COLORS

declare -a sourcing=(
#                     ".path"                     # Path configuration
#                     ".bash_prompt"              # Bash prompt
                      ".extra"                    # Misc configurations
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
