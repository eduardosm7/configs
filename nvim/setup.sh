#/bin/bash

set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function log {
    echo "[$(date +'%H:%M:%S')] -> $1"
}

function install_neovim {
    log "Checking if NeoVim is already installed..."

    if type nvim > /dev/null; then
        log "NeoVim is already installed"
    else
        log "NeoVim is not installed, installing now..."
        sudo apt install --assume-yes nvim
    fi

    log "NeoVim was successfully installed"
}

function install_dependencies {
    log "Installing dependencies..."

    # Python's Neovim Lib
    log "Installing Python's Neovim Lib..."
    pip3 install neovim --user
    log "Python's Neovim Lib was successfully installed"

    # The Silver Searcher
    log "Installing The Silver Searcher..."
    sudo apt install silversearcher-ag
    log "The Silver Searcher was successfully installed"

    # Powerline Fonts
    log "Installing Powerline Fonts..."
    sudo apt install fonts-powerline
    log "Powerline Fonts was successfully installed"
}

function create_symbolic_link {
    log "Creating .config/nvim symbolic link..."

    CONFIG_NVIM_PATH=$HOME/.config/nvim

    if [ ! -L $CONFIG_NVIM_PATH ]; then
        ln -s $DIR $CONFIG_NVIM_PATH
    fi

    log "Symbolic link created"
}

function main {
    log "Setting NeoVim up..."
    install_neovim
    install_dependencies
    create_symbolic_link
    log "Finished NeoVim and dependencies installation with success"
}

main
