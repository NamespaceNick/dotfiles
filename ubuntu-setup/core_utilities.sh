#!/usr/bin/env bash
# installs core commands and functionalities for development environment

declare -a core_tools
core_tools=(
	"g++"
	"make"
)

for tool in ${core_tools[@]}
do
	sudo apt install -y $tool
done
