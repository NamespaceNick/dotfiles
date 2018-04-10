#!/usr/bin/env bash

# Installs necessary tools for new environment

OP_SYS=''
if uname -a | grep -i 'ARCH' &> /dev/null ; then
  echo "OS: Arch Linux"
  OP_SYS=ArchLinux
elif uname -a | grep -i 'darwin' &> /dev/null ; then
  echo "OS: MacOS"
  OP_SYS=MacOS
elif uname -a | grep -i 'ubuntu' &> /dev/null ; then
  echo "OS: Ubuntu Linux"
  OP_SYS=Ubuntu
elif uname -a | grep -i 'umich' &> /dev/null ; then
  echo "OS: CAEN (Red Hat Enterprise)"
  OP_SYS=Caen
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
