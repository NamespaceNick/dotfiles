#!/usr/bin/env bash
# installs core commands and functionalities for development environment

declare -a core_tools
core_tools=(
	"g++"
)

for tool in ${core_tools[@]}
do
	sudo apt install $tool
done
