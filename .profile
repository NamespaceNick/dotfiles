if [ -z ${MACHINE_NAME+x} ] ; then
  export PS1="\n[UNKOWN_MACHINE] \[\e[33m\]\w\[\e[m\] \n→ "
  return 0
fi

# Bash prompt
  # <\n>
  # <[machine name]> <pwd-yellow>
  # <→ >
export PS1="\n[$USER @ $MACHINE_NAME] \[\e[33m\]\w\[\e[m\] \n→ "
