#/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function log {
    echo -e "[$(date +'%H:%M:%S')] -> $1"
}

function install_fish {
    log "Checking if Fish is already installed..."

    if type fish > /dev/null; then
        log "Fish is already installed"
    else
        log "Fish is not installed, installing now..."
        sudo apt-add-repository ppa:fish-shell/release-3
        sudo apt update
        sudo apt install --assume-yes fish
    fi

    log "Fish was installed successfully"
}

function install_dependencies {
    log "Installing dependencies..."

    # Oh My Fish
    log "Checking if Oh My Fish is already installed..."

    if fish -c "type omf" > /dev/null; then
        log "Oh My Fish is already installed"
    else
        log "Oh My Fish is not installed, installing now..."
        curl -L https://get.oh-my.fish | fish
    fi
    log "Oh My Fish was installed successfully"
}

function create_symbolic_link {
    log "Creating .config/fish symbolic link..."

    FISH_CONF_PATH=$HOME/.config/fish

    rm -rf $FISH_CONF_PATH

    if [ ! -L $FISH_CONF_PATH ]; then
        ln -s $DIR $FISH_CONF_PATH
    fi

    log "Symbolic link created"
}

function set_fish_as_default_shell {
    log "Setting fish as default shell..."

    log "Checking if fish is already the default shell..."
    if [[ $SHELL == *"fish"* ]]; then
        log "Fish is already the default shell"
    else
        log "Fish is not the default shell, setting it..."
        chsh -s /usr/bin/fish
        log "\033[1;33mLogout and login to changes take effect\033[0m"
    fi

    log "Fish was successfully set as the default shell"
}

function main {
    log "Setting Fish up..."
    install_fish
    install_dependencies
    create_symbolic_link
    set_fish_as_default_shell
    log "Finished Fish and dependencies installation with success"
}

main
