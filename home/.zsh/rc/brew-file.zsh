# brew-file wrapper
if (( ! $+commands[brew] )); then
  return 1
fi

if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi
