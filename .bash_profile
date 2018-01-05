# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Get Bakke theme

unset file;
# Case insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;
# Append to the Bash history file, rather than overwriting it
shopt -s histappend
# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# & `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && \
  [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion";
fi;

declare -a sourcing=(
                      ".path"                     # Path configuration
                      ".bash_prompt"              # Bash prompt
                      ".extra"                    # Misc configurations
                      ".aliases"                  # Bash aliases
                      ".bash_functions"           # Bash functions
                      ".local/bin/bashmarks.sh"   # Bashmarks plugin
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
#                           PLUGINS                                       #
###########################################################################

# Bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# Bashmarks
source ~/.local/bin/bashmarks.sh


# Add Cargo to path
export PATH="$HOME/.cargo/bin:$PATH";
