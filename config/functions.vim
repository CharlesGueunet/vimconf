" This file contain some usefull function, to Update plugins, debug, fold ...

" Tools
"""""""""""""""""""""""""""""""""""""""


" Update the vim configuration
function! Update()
    call dein#clear_state() | call dein#update() | call dein#recache_runtimepath()
endfunction
command! Update call Update()

" Ask vim-clang to compile the project to debug the autocompletion
function! ClangCheck()
    let g:clang_diagsopt = 'rightbelow:6'
    ClangSyntaxCheck
endfunction
autocmd FileType c,cpp command! ClangCheck call ClangCheck()

" Clever fold all using language specific syntax
function! FoldAll()
    set foldmethod=syntax
    redraw!
    set foldmethod=manual
endfunction
command! FoldAll call FoldAll()

" Trailling space removal

function TrimSpaces() range
    " http://vim.wikia.com/wiki/Remove_unwanted_spaces
    let _s=@/
    :%s/\s\+$//e
    let @/=_s
    nohl
endfunction

" Dein plugin management

function! DisablePlugins()
    for plugin in g:Vimmic_DISABLED
        call dein#disable(plugin)
    endfor
endfunction

function! AddPlugins()
    for plugin in g:Vimmic_ADDED
        if has_key(plugin, 'opt')
            call dein#add(plugin.name, plugin.opt)
        else
            call dein#add(plugin.name)
        endif
    endfor
endfunction

" Execute macro on each line
" From: https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim?_utm_source=1-2-2
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Highlight
"""""""""""""""""""""""""""""""""""""""

" Highlight the current word under the cursor, except some groups
" http://stackoverflow.com/questions/1551231/highlight-variable-under-cursor-in-vim-like-in-netbeans
let g:no_highlight_group_for_current_word=["Statement", "Comment", "Type", "PreProc"]
function! s:HighlightWordUnderCursor()
    let l:syntaxgroup = synIDattr(synIDtrans(synID(line("."), stridx(getline("."), expand('<cword>')) + 1, 1)), "name")

    if (index(g:no_highlight_group_for_current_word, l:syntaxgroup) == -1)
        execute printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
    else
        execute 'match IncSearch /\V\<\>/'
    endif
endfunction

if !exists("g:disable_highlightWordUnderCursor") && !exists("g:disable_defaultColors")
    autocmd CursorMoved * call s:HighlightWordUnderCursor()
endif

" Plugins
"""""""""""""""""""""""""""""""""""""""

" for commentary, toggle the comment type (c/cpp)
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
