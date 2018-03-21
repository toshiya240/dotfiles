#! /bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install rcmdnk/file/brew-file
brew file set_repo toshiya240/Brewfile
brew file install
