" tpope/vim-commentary
" operator to comment region / selection

let s:pluginName='vim-commentary'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " Use // comment for c/cpp in vim-commentary (instead of /* .. */)
    autocmd FileType c,cpp setlocal commentstring=//\ %s
    autocmd FileType cmake setlocal commentstring=#\ %s

    " Shortcut
    """"""""""
    " toogle between block and line comment in c/cpp
    autocmd FileType c,cpp map gct :call ToogleCommentaryCCPP()<CR>

    " Theme
    """""""
    " None

    " Function
    let s:commentaryBlock = 0
    function! ToogleCommentaryCCPP()
       if s:commentaryBlock
          setlocal commentstring=//\ %s
          let s:commentaryBlock = 0
          echo "Comment now use //"
       else
          setlocal commentstring=/*\ %s\ */
          let s:commentaryBlock = 1
          echo "Comment now use /* */"
       endif
    endfunction

else
    if index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
