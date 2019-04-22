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
    
    <!--- Install cmake --->
    sudo apt-get install cmake

    <!--- Install pip --->
    sudo apt install python3-pip -y

    sudo apt-get install python-dev python3-dev -y

    <!--- if msbuild/xbuild required, install from website --->
    https://www.mono-project.com/download/stable/

    <!--- if go is required to build gocode --->
    sudo apt install wget git

    sudo apt install golang

    <!--- install go path --->
    echo 'export GOPATH=$HOME/go' >> ~/.bashrc
    echo 'export PATH=${PATH}:${GOPATH}/bin' >> ~/.bashrc
    source ~/.bashrc

    <!--- if node is required to set up Tern --->
    sudo apt install nodejs
    sudo apt install npm

    <!--- if cargo is required for the Rust completer [restart device after install]--->
    sudo apt install curl
    curl https://sh.rustup.rs -sSf | sh
