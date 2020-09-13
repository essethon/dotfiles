" source .basic.vim from https://github.com/amix/vimrc {{{
let $VIMRC_BASIC = $HOME . "/.basic.vimrc"
if ***REMOVED***lereadable($VIMRC_BASIC)
    source $VIMRC_BASIC
endif
" ***REMOVED******REMOVED******REMOVED***

" source vim plug manager con***REMOVED***gurations {{{
let $VIMRC_PLUG = $HOME . "/.plug.vimrc"
if ***REMOVED***lereadable($VIMRC_PLUG)
    source $VIMRC_PLUG
endif
" ***REMOVED******REMOVED******REMOVED***
"
" My settings here
set nu

if has('gui_macvim')
    set guifont=JetBrains\ Mono:h13
    set linespace=3
    set macligatures

    try
        colorscheme onedark
        let g:lightline = {
          \ 'colorscheme': 'onedark',
          \ ***REMOVED***
    catch
    endtry

endif
