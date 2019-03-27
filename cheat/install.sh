#! /usr/bin/env bash
PREFIX=~

source ../installEnv.sh

installPublic() {
    sudo pip install cheat
}

installPrivate() {
    git clone https://github.com/liuyang1/cheat.git
    pushd cheat
    sudo python setup.py install
}

# installPrivate

installDotFile cheat "$HOME"

echo "OK"
