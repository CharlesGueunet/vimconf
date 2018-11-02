" AndrewRadev/sideways.vim
" Rotate argument / list

let s:pluginName='sideways.vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " None

    " Shortcut
    """"""""""
    nnoremap <leader>pc :SidewaysRight<CR>
    nnoremap <leader>pC :SidewaysLeft<CR>

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
