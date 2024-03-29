#!/bin/sh
#
# dot
#
# `dot` handles installation, updates, things like that. Run it periodically
# to make sure you're on the latest and greatest.
export ZSH=$HOME/.dotfiles

# Set macOS defaults
$ZSH/macos/set-defaults.sh

# Upgrade homebrew
echo "› brew update"
brew update

# Install software
echo "› $ZSH/script/install"
$ZSH/script/install
