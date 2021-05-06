#!/bin/bash

OS="$(uname -s)"
case "${OS}" in
    Darwin*)
        cp ${HOME}/.{vimrc,basic.vimrc,plug.vimrc} ./
        cp ${HOME}/.gitignore_global ./
        cp ${HOME}/.{zshrc,zshenv} ./
        cp ${HOME}/.tmux.conf ./

        # Remove personal info in git-config file
        awk '!/name = |email = |signingkey = |essethon|stdgeodesic/' ${HOME}/.gitconfig > ./.gitconfig
        awk '!/trickysky/' ${HOME}/.functions.zsh > ./.functions.zsh
        ;;
    Linux*)
        cp ${HOME}/.zshrc ./.zshrc-linux-simple
        ;;
    *)
        echo "Unknown OS: ${OS}"
esac


