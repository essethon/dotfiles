#!/usr/bin/env zsh

cp ./.functions.zsh ~/.functions.zsh
cp ./.zshenv ~/.zshenv
cp ./.vimrc ~/.vimrc
cp ./.basic.vimrc ~/.basic.vimrc
cp ./.plug.vimrc ~/.plug.vimrc
cp ./.tmux.conf ~/.tmux.conf

# echo 'Please set gitcon***REMOVED***g by'
# echo '  git con***REMOVED***g --global user.name <your name>'
# echo '  git con***REMOVED***g --global user.email <your email>'

os=`uname`

echo -n "Select zsh theme: [1] p10k [2] spaceship (default [1]): "
read theme
case $theme in
2)
    echo "Using Spaceship-prompt."
    cp ./.zshrc.nogui.spaceship.zsh ${HOME***REMOVED***/.zshrc
    case $os in
    Darwin|FreeBSD)
        echo "Using BSD style con***REMOVED***g ***REMOVED***les."
        cp ./.alias.bsd.zsh ${HOME***REMOVED***/.alias.zsh;;
    Linux)
        echo "Using GNU stype con***REMOVED***g ***REMOVED***les."
        cp ./.alias.gnu.zsh ${HOME***REMOVED***/.alias.zsh;;
    *)
        echo "Unsupported Operating System. Exiting."
        exit 1;;
    esac
    ;;
*)
    echo "Using Powerlevel10k"
    cp ./.zshrc.nogui.p10k.zsh ${HOME***REMOVED***/.zshrc
    case $os in
    Darwin|FreeBSD)
        echo "Using BSD style con***REMOVED***g ***REMOVED***les."
        cp ./.alias.bsd.zsh ${HOME***REMOVED***/.alias.zsh;;
    Linux)
        echo "Using GNU stype con***REMOVED***g ***REMOVED***les."
        cp ./.alias.gnu.zsh ${HOME***REMOVED***/.alias.zsh;;
    *)
        echo "Unsupported Operating System. Exiting."
        exit 1;;
    esac
    ;;
esac

gitcon***REMOVED***g() {
    echo -n "
===================================
      * Git Con***REMOVED***guration *
-----------------------------------
Please input Git Username: "

    read username

    echo -n "
-----------------------------------
Please input Git Email: "

    read email

    echo -n "
-----------------------------------
Done!
===================================
"

    git con***REMOVED***g --global user.name "${username***REMOVED***"
    git con***REMOVED***g --global user.email "${email***REMOVED***"
***REMOVED***

# Read git con***REMOVED***g
git_username=$(git con***REMOVED***g --global user.name)
git_email=$(git con***REMOVED***g --global user.email)
cp ./.gitcon***REMOVED***g ~/.gitcon***REMOVED***g

if [ -z "$git_username" ]; then
    gitcon***REMOVED***g
else
    git con***REMOVED***g --global user.name ${git_username***REMOVED***
    git con***REMOVED***g --global user.email ${git_email***REMOVED***
***REMOVED***

echo -n "

Auto-sign commits when using git? [Y/n]:
"

read sign
case $sign in
n|N)
    git con***REMOVED***g --global commit.gpgsign false
    git con***REMOVED***g --global gpg.program $(which gpg)
    ;;
*)
    git con***REMOVED***g --global commit.gpgsign true
    git con***REMOVED***g --global gpg.program $(which gpg)
    ;;
esac
