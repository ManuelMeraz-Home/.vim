#! /usr/bin/env bash

# Switch to the `~/.vim` directory, and fetch submodules:
echo "Download vim plugins and install..."
cd $HOME/.vim && git submodule update --init --recursive 

# Install fuzzy finder
echo "Installing fuzzy finder..."
echo "Make sure to say NO to adding the source to bashrc, already in .profile for vim terminal!"
printf "y\ny\nn\n" | $HOME/.vim/bundle/fzf/install 
