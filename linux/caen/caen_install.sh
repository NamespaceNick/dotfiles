# Scripts to setup environment on CAEN (no root priveleges)

##########################################
##               tools                  ##
##########################################

mkdir -p $HOME/bin

for tool in tool_*
do
  source "$tool"
done

git clone \
  https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1

