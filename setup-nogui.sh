cp ./.functions.zsh ~/.functions.zsh
cp ./.zshenv ~/.zshenv
cp ./.vimrc ~/.vimrc
cp ./.basic.vimrc ~/.basic.vimrc
cp ./.plug.vimrc ~/.plug.vimrc
cp ./.gitcon***REMOVED***g ~/.gitcon***REMOVED***g
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

gitcon***REMOVED***g
