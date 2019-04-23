#! /usr/bin/env bash

# Vim 8 is required for a few of my plugins:
echo "Installing Vim 8..."
(add-apt-repository ppa:jonathonf/vim -y) >/dev/null
(apt -qq update) &> /dev/null
(apt -qq install vim -y) &> /dev/null

# Switch to the `~/.vim` directory, and fetch submodules:
echo "cd into .vim directory"
(cd ~/.vim)

echo "Download vim plugins and install..."
(git submodule update --init --recursive) > /dev/null


# Install fuzzy finder
echo "Installing fuzzy finder..."
(yes | ./bundle/fzf/install) > /dev/null

# Install YouCompleteMe and its dependencies
echo "Installing YouCompleteMe dependencies..."
(apt -qq install build-essential cmake python3-dev python3-pip -y) &> /dev/null

# Enable support for C family languages, there are additional flags if you'd like support for other languages that can be found in the [documentation](https://github.com/Valloric/YouCompleteMe).
echo "Installing YouCompleteMe for C family..."
(./bundle/YouCompleteMe/install.py --clang-completer) > /dev/null

echo "Done!"
