#! /usr/bin/env bash

# Vim 8 is required for a few of my plugins:
echo "Installing Vim 8..."
(add-apt-repository ppa:jonathonf/vim -y) >/dev/null
(apt -qq update) &> /dev/null
(apt -qq install vim -y) &> /dev/null

# Switch to the `~/.vim` directory, and fetch submodules:
echo "Download vim plugins and install..."
(cd $HOME/.vim && git submodule update --init --recursive) > /dev/null


# Install fuzzy finder
echo "Installing fuzzy finder..."
echo "Make sure to say NO to adding the source to bashrc, already in .profile for vim terminal!"
($HOME/.vim/bundle/fzf/install) > /dev/null

# Install YouCompleteMe and its dependencies
echo "Installing YouCompleteMe dependencies..."
(apt -qq install g++ gcc build-essential cmake python-dev python3-dev python3-pip -y) &> /dev/null

echo "Installing python fixers with pip..."
(spinner pip3 install -r $HOME/requirements.txt)

# Enable support for C family languages, there are additional flags if you'd like support for other languages that can be found in the [documentation](https://github.com/Valloric/YouCompleteMe).
echo "Installing YouCompleteMe for C family..."
($HOME/.vim/bundle/YouCompleteMe/install.py --clang-completer) > /dev/null

echo "Done!"
