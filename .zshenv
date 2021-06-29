export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

(( $PATH[(I)/usr/local/sbin] )) || export PATH="/usr/local/sbin:$PATH"
(( $PATH[(I)/usr/local/bin] )) || export PATH="/usr/local/bin:$PATH"
(( $PATH[(I)$HOME/.local/bin] )) || export PATH="$HOME/.local/bin:$PATH"

# Go
if [ -d "$HOME/.go" ]
then
    # I'm using Homebrew-installed Go
    export GOROOT=/usr/local/Cellar/go/1.16.5
    export GOPATH=$HOME/Developer/local/go
    export GOBIN=$GOPATH/bin

    # (( $PATH[(I)$GOROOT] )) || export PATH="$GOROOT/bin:$PATH"
    (( $PATH[(I)$GOBIN] )) || export PATH="$GOBIN:$PATH"
fi
if [ -d "/usr/local/go" ] # Go is installed manually
then
  export GOROOT=/usr/local/go
  (( $PATH[(I)$GOROOT] )) || export PATH="$GOROOT/bin:$PATH"
fi

# Rust
[[ ! -f $HOME/.cargo/env ]] || source $HOME/.cargo/env
