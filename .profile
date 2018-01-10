if [ -z ${MACHINE_NAME+x} ] ; then
  export MACHINE_NAME=UNKNOWN_MACHINE
fi

# Bash prompt
  # <\n>
  # <[machine name]> <pwd-yellow>
  # <→ >
export PS1="\n[$MACHINE_NAME] \[\e[33m\]\w\[\e[m\] \n→ "

