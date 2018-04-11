#!/usr/bin/env bash

# Installs necessary tools for new environment

export DOT_DIR=`pwd`
# TODO: Unsure if necessary
export OS_DOT_DIR=''
export OP_SYS=''
if uname -a | grep -i 'ARCH' &> /dev/null ; then
  echo "OS: Arch Linux"
  OP_SYS=arch
  OS_DOT_DIR=$DOT_DIR/os/arch
elif uname -a | grep -i 'darwin' &> /dev/null ; then
  echo "OS: MacOS"
  OP_SYS=mac
  OS_DOT_DIR=$DOT_DIR/os/mac
elif uname -a | grep -i 'ubuntu' &> /dev/null ; then
  echo "OS: Ubuntu Linux"
  OP_SYS=ubuntu
  OS_DOT_DIR=$DOT_DIR/os/ubuntu
elif uname -a | grep -i 'umich' &> /dev/null ; then
  echo "OS: CAEN (Red Hat Enterprise)"
  OP_SYS=caen
  OS_DOT_DIR=$DOT_DIR/os/caen
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
      source install.sh
      break ;;

    [Nn]*)
      echo "Aborting.."
      exit 1 ;;

    *)
      echo "Please enter a letter [Yy/Nn]" ;;
  esac
done
