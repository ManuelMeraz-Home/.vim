#! /usr/bin/env bash

# Vim 8 is required for a few of my plugins:
echo "Installing Vim 8..."
(add-apt-repository ppa:jonathonf/vim -y) >/dev/null
(sudo apt -qq update) &> /dev/null
(sudo apt -qq install vim -y) &> /dev/null

# Switch to the `~/.vim` directory, and fetch submodules:
echo "Download vim plugins and install..."
(cd $HOME/.vim && git submodule update --init --recursive) > /dev/null


# Install fuzzy finder
echo "Installing fuzzy finder..."
echo "Make sure to say NO to adding the source to bashrc, already in .profile for vim terminal!"
(printf "y\ny\nn\n" | $HOME/.vim/bundle/fzf/install) > /dev/null

# Install YouCompleteMe and its dependencies
echo "Installing YouCompleteMe dependencies..."
(sudo apt -qq install g++ gcc build-essential cmake python-dev python3-dev python3-pip -y) &> /dev/null

# Enable support for C family languages, there are additional flags if you'd like support for other languages that can be found in the [documentation](https://github.com/Valloric/YouCompleteMe).
echo "Installing YouCompleteMe for C family..."
($HOME/.vim/bundle/YouCompleteMe/install.py --clang-completer) > /dev/null

echo "Installing python fixers for ALE..."
(pip3 install -r requirements.txt)

echo "Installing cpp fixers for ALE..."
(sudo apt -qq clang clang-tidy clang-format ) &> /dev/null

[[ ! -e $HOME/.clang-tidy ]] && cp $HOME/.vim/.clang-tidy $HOME
[[ ! -e $HOME/.clang-format ]] && cp $HOME/.vim/.clang-format $HOME

echo "Done!"
