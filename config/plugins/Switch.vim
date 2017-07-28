" AndrewRadev/switch.vim
" switch between differents expressions

let s:pluginName='switch.vim'
if dein#util#_check_install(s:pluginName) == 0

    " Settings
    """"""""""
    let b:switch_custom_definitions = [
                \   ['true', 'false'],
                \   {
                \     '\<[a-z0-9]\+_\k\+\>': {
                \       '_\(.\)': '\U\1'
                \     },
                \     '\<[a-z0-9]\+[A-Z]\k\+\>': {
                \       '\([A-Z]\)': '_\l\1'
                \     },
                \   }
                \ ]

    autocmd FileType c,cpp let b:switch_custom_definitions = [
                \  {
                \     '\(\k\+\)\.': '\1->',
                \     '\(\k\+\)->': '\1.',
                \  },{
                \     '\.': '->',
                \     '->': '.',
                \  },{
                \     '==':'!=',
                \     '!=':'==',
                \  }
                \ ]

    " Shortcut
    """"""""""
    map <leader>i :Switch<cr>

    " Theme
    """""""
    " None

else
    echom s:pluginName.' not found, try :Update'
endif
