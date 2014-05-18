#! /bin/bash

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
cd $HOME
sudo brew bundle
