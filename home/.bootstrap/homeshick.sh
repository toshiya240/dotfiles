#! /bin/bash

### Install homeshick
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/respos/homeshick
source $HOME/.homesick/repos/homeshick/homeshick.sh

### Clone repos
homeshick clone --batch toshiya240/dotfiles
homeshick clone --batch toshiya240/prezto
homeshick clone --batch Shougo/neobundle.git

### Link
homeshick link --force dotfiles
