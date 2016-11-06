#
# zplug
#
source ~/.zplug/init.zsh

# local plugins
zplug "~/.zsh/plugins", from:local

# prezto
source ~/.zsh/preztorc
zplug "modules/environment",              from:prezto, nice:-10
zplug "modules/utility",                  from:prezto, nice:-5
zplug "modules/editor",                   from:prezto
zplug "modules/history",                  from:prezto
zplug "modules/directory",                from:prezto
zplug "modules/completion",               from:prezto
zplug "modules/tmux",                     from:prezto
zplug "modules/osx",                      from:prezto, if:"[[   $OSTYPE == *darwin* ]]"
zplug "modules/ruby",                     from:prezto
zplug "modules/syntax-highlighting",      from:prezto, nice:10
zplug "modules/history-substring-search", from:prezto, nice:12
zplug "modules/autosuggestions",          from:prezto, nice:15

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# source plugins and add commands to $PATH
zplug load --verbose

#
# source local rc
#
for rc in ~/.zsh/rc/*; do
  source $rc
done
