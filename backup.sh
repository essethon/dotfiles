#!/bin/bash

OS="$(uname -s)"
case "${OS***REMOVED***" in
    Darwin*)
        cp ${HOME***REMOVED***/.{vimrc,basic.vimrc,plug.vimrc***REMOVED*** ./
        cp ${HOME***REMOVED***/.gitignore_global ./
        cp ${HOME***REMOVED***/.{zshrc,zsh_functions***REMOVED*** ./
        cp ${HOME***REMOVED***/.tmux.conf ./

        # Remove personal info in git-con***REMOVED***g ***REMOVED***le
        awk '!/name = |email = |signingkey = |essethon/' ${HOME***REMOVED***/.gitcon***REMOVED***g > ./.gitcon***REMOVED***g
        ;;
    Linux*)
        cp ${HOME***REMOVED***/.zshrc ./.zshrc-linux-simple
        ;;
    *)
        echo "Unknown OS: ${OS***REMOVED***"
esac


