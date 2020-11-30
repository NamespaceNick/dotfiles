#!/usr/bin/env bash
# Creates symbolic links in new development environment home to the dotfiles in the dotfiles directory

export DOTFILE_PATH="$HOME/developer/dotfiles"

declare -a dotfiles
dotfiles=(
	.aliases
	.always_forget
	.bash_functions
	.bash_profile
	.bashrc
	.profile
	.vimrc
)
# Bash files
# Create symlinks
for d_file in ${dotfiles[@]}
do
	ln -sf "$DOTFILE_PATH"/"$d_file" "$HOME"/"$d_file"
done

source $HOME/.bash_profile

mkdir -p $HOME/.ssh
ln -sf "$DOTFILE_PATH"/ssh_config "$HOME"/.ssh/config

# Vim setup (& install / run vim-plug)


# Clone relevant repositories
git clone git://github.com/yyuu/pyenv.git "$HOME/.pyenv"
