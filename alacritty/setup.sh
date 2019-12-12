#/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function log {
    echo "[$(date +'%H:%M:%S')] -> $1"
}

function install_alacritty {
    log "Checking if alacritty is already installed..."

    if type alacritty > /dev/null; then
        log "Alacritty is already installed"
    else
        log "Alacritty is not installed, installing now..."
        sudo add-apt-repository ppa:mmstick76/alacritty
        sudo apt install --assume-yes alacritty
        log "Alacritty was installed successfully"
    fi
}

function create_symbolic_link {
    log "Creating .config/alacritty symbolic link..."

    ALACRITTY_CONF_PATH=$HOME/.config/alacritty

    if [ -d $ALACRITTY_CONF_PATH ]; then
        rm -rf $ALACRITTY_CONF_PATH
    fi

    if [ ! -L $ALACRITTY_CONF_PATH ]; then
        ln -s $DIR $ALACRITTY_CONF_PATH
    fi

    log "Symbolic link created"
}

function set_alacritty_as_default_terminal {
    log "Setting Alacritty as default terminal..."

    sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty

    log "Alacritty was successfully set as default terminal"
}

function main {
    log "Setting Alacritty up..."
    install_alacritty
    create_symbolic_link
    set_alacritty_as_default_terminal
    log "Finished Alacritty installation with success"
}

main
