#!/bin/bash

cp ${HOME***REMOVED***/.{vimrc,basic.vimrc,plug.vimrc***REMOVED*** ./
cp ${HOME***REMOVED***/.gitignore_global ./
cp ${HOME***REMOVED***/.{zshrc,zsh_functions***REMOVED*** ./

# Remove personal info in git-con***REMOVED***g ***REMOVED***le
awk '!/name = |email = |signingkey = |essethon/' ${HOME***REMOVED***/.gitcon***REMOVED***g > ./.gitcon***REMOVED***g
