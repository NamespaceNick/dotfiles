#!/usr/bin/env bash

# Installs necessary tools for new environment

export DOT_DIR=`pwd`
export OS_DIR
export OP_SYS=''

installation_type=''
if uname -a | grep -i 'ARCH' &> /dev/null ; then
  echo "OS: Arch Linux"
  OP_SYS=arch
  OS_DIR=$DOT_DIR/os/arch
  installation_type=arch_install.sh
elif uname -a | grep -i 'darwin' &> /dev/null ; then
  echo "OS: MacOS"
  OP_SYS=mac
  OS_DIR=$DOT_DIR/os/mac
  installation_type=mac_install.sh
elif uname -a | grep -i 'ubuntu' &> /dev/null ; then
  echo "OS: Ubuntu Linux"
  OP_SYS=ubuntu
  OS_DIR=$DOT_DIR/os/ubuntu
  installation_type=ubuntu_install.sh
elif uname -a | grep -i 'umich' &> /dev/null ; then
  echo "OS: CAEN (Red Hat Enterprise)"
  OP_SYS=caen
  OS_DIR=$DOT_DIR/os/caen
  installation_type=caen_install.sh
else
  echo "WARNING: UNRECOGNIZED OPERATING SYSTEM. PLEASE TRY AGAIN."
fi

HM_DIR=$HOME

echo -e "Home directory: $HM_DIR\n"

while true ; do
  read -p "If the above information is correct, are you ready to continue? \
[Y/N]" response
  case $response in
    [Yy]*)
      break 2
      break ;;

    [Nn]*)
      echo "Aborting.."
      exit 1 ;;

    *)
      echo "Please enter a letter [Yy/Nn]" ;;
  esac
done

dotfiles=( .bash_profile .aliases .bash_functions )
for file in dotfiles
do
  ln -sf $DOT_DIR/$file $HM_DIR
done

# SSH config
mkdir -p $HM_DIR/.ssh
ln -sf $DOT_DIR/ssh_config $HM_DIR/.ssh/config

source $DOT_DIR/installations/$installation_type
