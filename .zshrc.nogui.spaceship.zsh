### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# Defer slow commands
zinit light romkatv/zsh-defer

# Load oh-my-zsh git library and plugin
zsh-defer zinit snippet OMZL::git.zsh
zsh-defer zinit snippet OMZP::git

zinit light denysdovhan/spaceship-prompt

zsh-defer zinit for \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zdharma/history-search-multi-word

zsh-defer zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions
zsh-defer zinit wait lucid atinit"zicompinit; zicdreplay" blockf for \
    zdharma/fast-syntax-highlighting


# zsh-completions settings
# allow autocomplete from the middle of file/folder name
zsh-defer zstyle ':completion:*' completer _complete
zsh-defer zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
# autoload -U compinit && compinit
unsetopt LIST_BEEP  # turn off auto completion beep

# GPG Agent and SSH Agent
# In WSL2, use a GPG bridge to access yubikey
UNAME=`uname -a`
if (( $UNAME[(I)WSL2] )); then
  # GPG Socket
  # Removing Linux GPG Agent socket and replacing it by link to wsl2-ssh-pageant GPG socket
  export GPG_AGENT_SOCK=$HOME/.gnupg/S.gpg-agent 
  ss -a | grep -q $GPG_AGENT_SOCK 
  if [ $? -ne 0 ]; then
    rm -rf $GPG_AGENT_SOCK
    setsid nohup socat UNIX-LISTEN:$GPG_AGENT_SOCK,fork EXEC:"$HOME/.ssh/wsl2-ssh-pageant.exe --gpg S.gpg-agent" &>/dev/null &
  fi

  # SSH Socket
  # Removing Linux SSH socket and replacing it by link to wsl2-ssh-pageant socket
  export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
  ss -a | grep -q $SSH_AUTH_SOCK
  if [ $? -ne 0 ]; then
    rm -f $SSH_AUTH_SOCK
    setsid nohup socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:$HOME/.ssh/wsl2-ssh-pageant.exe &>/dev/null &
  fi
else
  zsh-defer gpgconf --create-socketdir
fi

[[ ! -f ~/.alias.zsh ]] || source ~/.alias.zsh

# Credentials, e.g. Homebrew Github API Token
[[ ! -f ~/.credentials ]] || source ~/.credentials

# Include user functions
[[ ! -f ~/.functions.zsh ]] || source ~/.functions.zsh
