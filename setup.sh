#! /usr/bin/env bash

# Vim 8 is required for a few of my plugins:
echo "Installing Vim 8..."
add-apt-repository ppa:jonathonf/vim -y
apt -qq update
apt -qq install vim -y 

# Switch to the `~/.vim` directory, and fetch submodules:
echo "Download vim plugins and install..."
cd $HOME/.vim && git submodule update --init --recursive 


# Install fuzzy finder
echo "Installing fuzzy finder..."
echo "Make sure to say NO to adding the source to bashrc, already in .profile for vim terminal!"
printf "y\ny\nn\n" | $HOME/.vim/bundle/fzf/install 

# Install YouCompleteMe and its dependencies
echo "Installing YouCompleteMe dependencies..."

apt -qq install g++ gcc build-essential cmake python-dev python3-dev python3-pip -y 

# Enable support for C family languages, there are additional flags if you'd like support for other languages that can be found in the [documentation](https://github.com/Valloric/YouCompleteMe).
echo "Installing YouCompleteMe for C family..."
$HOME/.vim/bundle/YouCompleteMe/install.py --clang-completer 

echo "Installing python fixers with pip..."
pip3 install -r $HOME/.vim/requirements.txt

echo "Installing fixers for ALE..."
apt -qq install clang clang-tidy clang-format npm -y
npm install bash-language-server 
snap install shfmt 

[[ ! -e $HOME/.clang-tidy ]] && cp $HOME/.vim/.clang-tidy $HOME
[[ ! -e $HOME/.clang-format ]] && cp $HOME/.vim/.clang-format $HOME

echo "Done!"
