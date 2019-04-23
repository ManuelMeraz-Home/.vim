# Vim settings for Ubuntu

## Installation

```
cd ~
git clone https://github.com/ManuelMeraz/.vim.git
```

### Script that runs the following commands
```
sudo setup.sh 
```

Vim 8 is required for a few of my plugins:
```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```
Switch to the `~/.vim` directory, and fetch submodules:

```
cd ~/.vim
git submodule update --init --recursive
```

Install fuzzy finder
```
./bundle/fzf/install
```

Install YouCompleteMe and its dependencies
```
sudo apt install build-essential cmake python3-dev python3-pip
```

Enable support for C family languages, there are additional flags if you'd like support for other languages that can be found in the [documentation](https://github.com/Valloric/YouCompleteMe).
```
./bundle/YouCompleteMe/install.py --clang-completer --clangd-completer
```

