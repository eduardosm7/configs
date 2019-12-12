#/bin/bash

set -e

TPM_PATH="$HOME/.tmux/plugins/tpm"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function log {
    echo "[$(date +'%H:%M:%S')] -> $1"
}

function install_tmux {
    log "Checking if tmux is already installed..."

    if type tmux > /dev/null; then
        log "Tmux is already installed"
    else
        log "Tmux is not installed, installing now..."
        sudo apt install --assume-yes tmux
        log "Tmux was installed successfully"
    fi
}

function install_dependencies {
    log "Installing dependencies..."

    # Tmux Plugin Manager
    log "Checking if Tmux Plugin Manager is already installed..."
    if [ -d $TPM_PATH ]; then
        log "Tmux Plugin Manager is already installed"
    else
        log "Tmux Plugin Manager is not installed, installing now..."
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        log "Tmux Plugin Manager was installed successfully"
    fi
}

function create_symbolic_link {
    log "Creating .tmux.conf symbolic link..."

    TMUX_CONF_PATH=$HOME/.tmux.conf

    if [ -f $TMUX_CONF_PATH ]; then
        rm $TMUX_CONF_PATH
    fi

    if [ ! -L $TMUX_CONF_PATH ]; then
        ln -s $DIR/.tmux.conf $TMUX_CONF_PATH
    fi

    log "Symbolic link created"
}

function main {
    log "Setting Tmux up..."
    install_tmux
    install_dependencies
    create_symbolic_link
    log "Finished Tmux and dependencies installation with success"
}

main
