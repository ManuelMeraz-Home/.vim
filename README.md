Installation:

    cd ~
    git clone https://github.com/ManuelMeraz/.vim.git

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule update --init --recursive

    <!--- Install fuzzy finder --->
    ./bundle/fzf/install

    sudo apt-get install python-dev python3-dev -y
    ./bundle/YouCompleteMe/install.py --all
