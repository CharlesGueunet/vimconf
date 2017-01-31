" airblade/vim-gitgutter
" Git changes indicators and diff

" Settings
""""""""""
let g:gitgutter_override_sign_column_highlight = 0


" Shortcut
""""""""""
" diff from git
map <leader>gd <leader>hp
" highlight different lines
map <leader>gh :GitGutterLineHighlightsToggle<cr>
" Revert this section from git
map <leader>gr :GitGutterUndoHunk<cr>


" Theme
"""""""
function! s:GitgutterColors()
    highlight GitGutterAdd ctermbg=none ctermfg=green
    highlight GitGutterChange ctermbg=none ctermfg=yellow
    highlight GitGutterChangeDelete ctermbg=none ctermfg=yellow
    highlight GitGutterDelete ctermbg=none ctermfg=red
    highlight GitGutterAddLine ctermbg=22
    highlight GitGutterChangeLine ctermbg=94
    highlight GitGutterDeleteLine ctermbg=88
endfunction

if !exists("g:disable_defaultColors")
    autocmd VimEnter * call s:GitgutterColors()
endif
