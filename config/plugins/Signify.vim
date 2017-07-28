" mhinz/vim-signify
" Show lines modified corresponding to versionning system

let s:pluginName='vim-signify'
if dein#util#_check_install(s:pluginName) == 0

    " Settings
    """"""""""
    let g:signify_vcs_list = [ 'accurev','bzr','cvs','darcs','fossil','hg','perforce','rcs','svn','tfs']

    " Shortcut
    """"""""""
    " None

    " Theme
    """""""
    function! s:SignifyColors()
        highlight SignifySignAdd    cterm=bold  ctermfg=119
        highlight SignifySignDelete cterm=bold  ctermfg=167
        highlight SignifySignChange cterm=bold  ctermfg=227
    endfunction

    if !exists("g:disable_defaultColors")
        autocmd VimEnter * call s:SignifyColors()
    endif

else
    echom s:pluginName.' not found, try :Update'
endif
