if [ -z ${MACHINE_NAME+x} ] ; then
  export PS1="\n[UNKOWN_MACHINE] \[\e[33m\]\w\[\e[m\] \n→ "
  return 0
fi

# Bash prompt
  # <\n>
  # <[machine name]> <pwd-yellow>
  # <→ >

# Check if currently in a virtual environment

if [[ "$VIRTUAL_ENV" != "" ]]; then
	export PS1="\n(\[\033[0;34m\]env\[\033[0;0m\]) [$USER @ $MACHINE_NAME] \[\e[33m\]\w\[\e[m\] \n→ "
else
	export PS1="\n[$USER @ $MACHINE_NAME] \[\e[33m\]\w\[\e[m\] \n→ "
fi
