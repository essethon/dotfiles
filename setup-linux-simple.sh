cp ./.zshrc-linux-simple ~/.zshrc
cp ./.zsh_functions ~/.zsh_functions
cp ./.vimrc ~/.vimrc
cp ./.basic.vimrc ~/.basic.vimrc
# cp ./.plug.vimrc ~/.plug.vimrc
cp ./.gitcon***REMOVED***g ~/.gitcon***REMOVED***g
cp ./.tmux.conf ~/.tmux.conf

# echo 'Please set gitcon***REMOVED***g by'
# echo '  git con***REMOVED***g --global user.name <your name>'
# echo '  git con***REMOVED***g --global user.email <your email>'

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
