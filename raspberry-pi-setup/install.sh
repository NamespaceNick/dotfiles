#!/usr/bin/env bash
# Run all bash installation scripts
# NOTE: use the source command on this file

declare -a install_scripts
install_scripts=(
	prerequisites.sh
	core_utilities.sh
	move_dotfiles.sh
	terminal_setup.sh
	personal_repositories.sh
)

for script in ${install_scripts[@]}
do
	source $script
done

