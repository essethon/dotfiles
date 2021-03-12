# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# con***REMOVED***rmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache***REMOVED***/p10k-instant-prompt-${(%):-%n***REMOVED***.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache***REMOVED***/p10k-instant-prompt-${(%):-%n***REMOVED***.zsh"
***REMOVED***

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33***REMOVED***▓▒░ %F{220***REMOVED***Installing %F{33***REMOVED***DHARMA%F{220***REMOVED*** Initiative Plugin Manager (%F{33***REMOVED***zdharma/zinit%F{220***REMOVED***)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33***REMOVED***▓▒░ %F{34***REMOVED***Installation successful.%f%b" || \
        print -P "%F{160***REMOVED***▓▒░ The clone has failed.%f%b"
***REMOVED***

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps***REMOVED*** )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
# Defer slow commands
zinit light romkatv/zsh-defer

# Load oh-my-zsh git library and plugin
zsh-defer zinit snippet OMZL::git.zsh
zsh-defer zinit snippet OMZP::git

zinit for \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zdharma/history-search-multi-word \
    light-mode  denysdovhan/spaceship-prompt

zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions
zinit wait lucid atinit"zicompinit; zicdreplay" blockf for \
    zdharma/fast-syntax-highlighting


# zsh-completions settings
# allow autocomplete from the middle of ***REMOVED***le/folder name
zsh-defer zstyle ':completion:*' completer _complete
zsh-defer zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]***REMOVED***={[:upper:][:lower:]***REMOVED***' '+l:|=* r:|=*'
# autoload -U compinit && compinit
unsetopt LIST_BEEP  # turn off auto completion beep

# GPG Agent forward
zsh-defer gpgconf --create-socketdir

[[ ! -f ~/.alias.zsh ]] || source ~/.alias.zsh

# Credentials, e.g. Homebrew Github API Token
[[ ! -f ~/.credentials ]] || source ~/.credentials

# Include user functions
[[ ! -f ~/.functions.zsh ]] || source ~/.functions.zsh

# To customize prompt, run `p10k con***REMOVED***gure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k]***REMOVED*** )) || p10k ***REMOVED***nalize