" osyo-manga/vim-over
" Search and replace with preview

let s:pluginName='vim-over'
silent let loaded = dein#util#_check_install(s:pluginName)
if loaded

    " Settings
    """"""""""
    " Nonde

    " Shortcut
    """"""""""
    " Replace word under cursor in line
    nnoremap <Leader>r :OverCommandLine<CR>%s/\<<C-r><C-w>\>//g<Left><Left>
    nnoremap <Leader>s :OverCommandLine<CR>%s///g<Left><Left><Left>
    " in visual mode, mapping a simple letter can conflict with snippets
    vnoremap <C-r> <Esc>:OverCommandLine<CR>'<,'>s/

    " Theme
    """""""
    " None

else
    silent echom s:pluginName.' not found, try :Update'
endif
