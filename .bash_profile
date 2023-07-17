#!/usr/bin/env bash
# Bash configuration for all machines

# Prevents duplicates in path
function prepend_path() {
  [[ ":$PATH:" != *":$1:"* ]] && PATH=$1:$PATH
}

function append_path() {
  [[ ":$PATH:" != *":$1:"* ]] && PATH=$PATH:$1
}

# Preserve virtual environment in new tmux windows/panes
function sv() {
	source env/bin/activate &&
		tmux set-environment VIRTUAL_ENV $VIRTUAL_ENV
	source ~/.profile
}
if [ -n "$VIRTUAL_ENV" ]; then
	source $VIRTUAL_ENV/bin/activate;
fi

###########################################################################
#                           TOP-LEVEL                                     #
###########################################################################
# PATH
prepend_path $HOME/bin

export EDITOR="vim"
export DOTS="$HOME/developer/dotfiles"

# Ensure new dotfiles are updated
# Bash settings
shopt -s histappend
shopt -s nocaseglob
shopt -s cdspell
HISTSIZE=1000

# `ls` colors
if [[ "$OSTYPE" == "darwin"* ]]; then
	LS_COLORS=$LS_COLORS:'di=1;33:ex=0;31:' ; export LS_COLORS
else
	LS_COLORS=$LS_COLORS:'di=4;34:ex=0;31:' ; export LS_COLORS
fi

# italics for terminal
# TODO: Need to add to other extra files
# export TERM=xterm-256color-italic
# export TERM=xterm-256color

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

# Install bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
else
	echo "bash-git-prompt not installed"
fi

# Suppress default interactive shell message on Mac
export BASH_SILENCE_DEPRECATION_WARNING=1


export LD_RUN_PATH="$HOME/.local/lib:$LD_RUN_PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"

export LESS="$LESS -R -Q" # Disable Windows terminal bell when using `less`

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"

# Install Ruby Gems to ~/gems' >> ~/.bashrc
# TODO: Check if Ruby is installed
export GEM_HOME="$HOME/gems"
prepend_path "$HOME/gems/bin"
prepend_path "/usr/local/opt/ruby/bin"

prepend_path "/opt/homebrew/bin"

# pyenv installation
export PYENV_ROOT="$HOME/.pyenv"
prepend_path "$PYENV_ROOT/bin"
eval "$(pyenv init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
