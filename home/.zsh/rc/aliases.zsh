# set aliases
alias ls="${aliases[ls]:-ls} -F"
alias eng='LANG=C LANGUAGE=C LC_ALL=C'
if [[ "$OSTYPE" == darwin* ]]; then
  alias vi='Vim'
  alias vim='Vim'
fi
