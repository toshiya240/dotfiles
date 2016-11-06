#
# utilities using peco
#
# Authors:
#   Toshiya NISHIO <toshiya240@gmail.com>
#

function exists { which $1 &> /dev/null }

# history search

if exists peco; then
  function peco_select_history() {
    local tac
    exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
    BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER         # move cursor
    zle -R -c               # refresh
  }

  zle -N peco_select_history
  bindkey '^R' peco_select_history 
fi

# cd history
CDHISTFILE=$HOME/.cd_history

typeset -gaU chpwd_functions

function chpwd_record_history() {
  [ $PWD = $HOME ] && return
  local hist
  hist=$(awk -v pwd=$PWD '\
    BEGIN { newdir = 1; }\
    $2 == pwd { newdir = 0; $1 = $1 + 1; print; }\
    $2 != pwd { print; }\
    END { if (newdir) { print(1, pwd); } }' $CDHISTFILE)
  [ -n "$hist" ] && echo "$hist" >! $CDHISTFILE
}

chpwd_functions+=chpwd_record_history

if exists peco; then
  function peco_select_dir() {
    local dir=$(sort -r $CDHISTFILE | sed -e 's/^[0-9]* //' |\
      peco)
    [ -n "$dir" ] && cd $dir
  }

  alias cdp='peco_select_dir'
fi
