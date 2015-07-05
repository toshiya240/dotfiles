#! /bin/bash

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew install rcmdnk/file/brew-file
brew file set_repo toshiya240/Brewfile
brew file install
