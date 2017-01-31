"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @file vimrc
" @author Charles Gueunet, Axel Martin
" @brief Vim main configuration file
" @version 0.6
" @date 04-01-2016
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Usefull variables                                                         {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Windows ?
let g:isWin = has('win16') || has('win32') || has('win64')
" / or \ depending on OS
let g:file_sep = (g:isWin)?'\':'/'
" Exemples on Linux, usinig original vim
" ~/
let g:Vimmic_HOME = fnamemodify(expand('<sfile>'), ':p:h:gs').g:file_sep
" ~/.vim/
let g:Vimmic_BASE = fnamemodify(resolve(expand('<sfile>')), ':p:h:gs').g:file_sep
" ~/.vim/config/
let g:Vimmic_CONFIG = g:Vimmic_BASE."config".g:file_sep
" ~/.vim/config/plugins/
let g:Vimmic_CONFIG_PLUGINS = g:Vimmic_CONFIG."plugins".g:file_sep
" ~/.vimrc.preconf
let g:Vimmic_PRECONF  = g:Vimmic_HOME.".vimrc.preconf"
" ~/.vimrc.postconf
let g:Vimmic_POSTCONF = g:Vimmic_HOME.".vimrc.postconf"
" ~/.vim/dein/repos/github.com/Shougo/dein.vim/
let g:Vimmic_DEIN = g:Vimmic_BASE.join(['dein','repos','github.com','Shougo','dein.vim'], g:file_sep)
"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dein first install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !filereadable(expand(g:Vimmic_DEIN).g:file_sep.'README.md')
    if executable('git')
exec '!git clone https://github.com/Shougo/dein.vim '.g:Vimmic_DEIN
    else
        echohl WarningMsg
        echom "Git needed ! (how did you get this conf without it ?)"
        echohl None
    endif

endif

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin import                                                             {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
execute 'set runtimepath^='.g:Vimmic_DEIN

" Required:
call dein#begin(g:Vimmic_BASE."dein")

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Load the ~/.vimrc.preconf if exist, after init dein
" to allow disabled plugins
if filereadable(g:Vimmic_PRECONF)
  execute 'source' g:Vimmic_PRECONF
  let g:deinNeedInstall=1
endif

" Modules

" GUI
call dein#add('vim-airline/vim-airline')
call dein#add('scrooloose/nerdtree')
call dein#add('majutsushi/tagbar')
call dein#add('MattesGroeger/vim-bookmarks')
call dein#add('kshenoy/vim-signature')
call dein#add('mbbill/undotree')
call dein#add('mhinz/vim-startify')
call dein#add('regedarek/ZoomWin')
call dein#add('myusuf3/numbers.vim')

" Versionning
call dein#add('airblade/vim-gitgutter')

" text Highlight / Motion
call dein#add('luochen1990/rainbow')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('corntrace/bufexplorer')
call dein#add('kana/vim-textobj-user')
call dein#add('kana/vim-textobj-indent')
call dein#add('terryma/vim-expand-region')
call dein#add('tpope/vim-surround')
call dein#add('Raimondi/delimitMate')
call dein#add('godlygeek/tabular')
call dein#add('osyo-manga/vim-over')
call dein#add('AndrewRadev/switch.vim')

" Completion / snippets
call dein#add('scrooloose/syntastic')
call dein#add('scrooloose/nerdcommenter')
call dein#add('garbas/vim-snipmate')
" Might replace snipmate
"call dein#add('Shougo/neocomplete.vim')
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" lib needed by nerdtree & others
call dein#add('tomtom/tlib_vim')
call dein#add('MarcWeber/vim-addon-mw-utils')

" Filetype dependant
""""""""""""""""""""""""
"C / CPP
call dein#add('justmao945/vim-clang', {'on_ft':["c","cpp"]})
call dein#add('octol/vim-cpp-enhanced-highlight', {'on_ft':["c","cpp"]})
"call dein#add('mrtazz/DoxygenToolkit.vim', {'on_ft':["c","cpp"]})
" Python
call dein#add('davidhalter/jedi-vim', {'on_ft':["python"]})
call dein#add('andviro/flake8-vim', {'on_ft':["python"]})
" XML / HTML
"call dein#add('alvan/vim-closetag', {'on_ft':["xml","html"]})
call dein#add('sukima/xmledit', {'on_ft':["xml","html"]})
" Latex
call dein#add('lervag/vimtex', {'on_ft':"tex"})
" Markdown
call dein#add('plasticboy/vim-markdown', {'on_ft':["markdown"]})

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if g:deinNeedInstall
    if dein#check_install()
        call dein#install()
    endif
endif

"End dein Scripts-------------------------

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global configuration                                                      {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader key
if !exists("mapleader")
    let mapleader=","                      " Leader key is `,`.
endif

" Basics configuration of the editor (file, search, completion, cursor, ...)
execute 'source '.g:Vimmic_CONFIG.'editor.vim'

" Basics colors and theme
execute 'source '.g:Vimmic_CONFIG.'theme.vim'

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Module and environment configuration                                      {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load all plugins confs
" Each file have:
"  - settings
"  - shortcuts
"  - colors and theme
for pluginConf in split(glob(g:Vimmic_CONFIG_PLUGINS."*"), '\n')
    execute 'source' pluginConf
endfor

" Custom snippets folder
execute 'set runtimepath ^='.g:Vimmic_BASE."snippets/vim-snipmate-snippets/"
execute 'set runtimepath ^='.g:Vimmic_BASE."snippets/vim-snippets/"

" Note for author : protodef is a plugin that allow creating function in cpp
" form protoype in header

" Complete XML code
let g:xml_syntax_folding=1

" Switch
""""""""""""""""""""""""""""""""""""""
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


" Syntastic
"""""""""""""""""""""""""""""""""""""""

" Important note : if you want to work on c++>11, it is recommanded to create
" a $HOME/.syntastic_cpp_check containing the configuration of clang / gcc for
" syntastic. Mine contains "-std=c++14"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0  " we don't want the error windows at startup
let g:syntastic_auto_loc_list = 2             " close error window when done
let g:syntastic_check_on_open = 1             " check file at startup
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 1           " for gvim, popup with mouse
let g:syntastic_c_check_header  = 1           " check header file
let g:syntastic_cpp_check_header  = 1

let g:syntastic_cpp_compiler_options = '-std=c++11'

" Compatible with vim-clang file:
"let g:syntastic_cpp_config_file='.vimconf'
"let g:syntastic_c_config_file='.vimconf'

" Do not run syntastic on Python files ; we have other tools for that.
let g:syntastic_python_checkers = []

" Prefere zsh over bash if installed
if !exists("g:syntastic_shell") && !g:isWin
    if filereadable("/bin/zsh")
        let g:syntastic_shell = '/bin/zsh'
    else
        let g:syntastic_shell = '/bin/bash'
    endif
endif

" Vim-airline configuration
"""""""""""""""""""""""""""""""""""""""

set laststatus=2                                                        " appear on first tab
let g:Powerline_symbols                          = 'fancy'              " theme setting
let g:airline#extensions#tabline#enabled         = 1                    " tab bar at the top
let g:airline#extensions#tabline#buffer_idx_mode = 1                    " tabs navigation enabled
let g:airline#extensions#tabline#fnamemod        = ':t'
let g:airline#extensions#tabline#show_tab_nr     = 1
let g:airline#extensions#tabline#formatter       = 'unique_tail'        " tab display only name
let g:airline#extensions#tagbar#enabled          = 1                    " link with tagbar
let g:airline#extensions#syntastic#enabled       = 1                    " link with syntastic
let g:airline#extensions#undotree#enabled        = 1                    " link with undotree

" Vim-clang
"""""""""""""""""""""""""""""""""""""""
let g:clang_auto = 0 " no complete after . (ctrl-x x does)
"let g:clang_dotfile = '.clang'
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libstdc++'
let g:clang_include_sysheaders_from_gcc = 1
let g:clang_compilation_database = '.'.g:file_sep.'build'
" non intrusive completion
let g:clang_diagsopt = ''
" default 'longest' can not work with neocomplete
let g:clang_c_completeopt = 'menuone,longest'
let g:clang_cpp_completeopt = 'menuone,longest'

" Vim-cpp enhanced highlight
"""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" Vim-markdown
"""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1

" Vim-UndoTree
""""""""""""""""""""""""""""""""""""""""
let g:undotree_TreeNodeShape = '●'

let g:undotree_HighlightChangedText = 0    " remove annoying highlight
let g:undotree_WindowLayout = 2            " undo-tree left, diff below.
let g:undotree_DiffAutoOpen = 0            " diff on demand
let g:undotree_ShortIndicators=1           " smaller panel
let g:undotree_SplitWidth=21               " and size

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts                                                                 {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Miscellaneous vim shortcuts
"""""""""""""""""""""""""""""""""""""""

" For qwerty it is easier tu use ; than :
map ; :

" Remap VIM 0 to first non-blank character
map 0 ^

" Prefere to quit insertion with ctrl-d than Esc
" PS: Ctrl-C is hard interrupt
imap <C-d> <Esc>
map <C-d> <Esc>


" F 1-12

" Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Copy pasting from the system
set pastetoggle=<F2>

" Stop checking for whitespace
map <F3> :AirlineToggleWhitespace<cr>

" Toogle syntastic with F4
map <F4> :SyntasticToggleMode<cr>

" Note, Maj F6 and Maj F7 are used by jedi

"""""

" Get rid of that stupid windows
map q: :q

" See the clipboards for pasting
map <leader>p :reg<CR>

" Folding
" fold between { }
map <leader>- [{zf%<CR>
" space toggle fold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Indent
vmap < <gv
vmap > >gv

" https://github.com/thirtythreeforty/dotfiles/blob/cb464b7ef00534aa06247e67f4e55c701022571f/vim/config/mappings.vim#L20-31
" Disable Ex mode, replace it with Execute Lines in Vimscript
function! ExecRange(line1, line2)
    exec substitute(join(getline(a:line1, a:line2), "\n"), '\n\s*\\', ' ', 'g')
    echom string(a:line2 - a:line1 + 1) . "L executed"
endfunction
command! -range ExecRange call ExecRange(<line1>, <line2>)

nnoremap Q :ExecRange<CR>
vnoremap Q :ExecRange<CR>

" Make Y yank to end of line (as suggested by Vim help)
noremap Y y$

" Hide highlight on search with <leader><space>
nnoremap <leader><space> :nohlsearch<cr>

" Hide the right margin (unify All background)
map <leader>a :hi clear ColorColumn<cr>

" Code oriented shortcuts
"""""""""""""""""""""""""""""""""""""""

" Code completion
"inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
"inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
inoremap <C-Space> <C-n>
inoremap <Nul> <C-n>
" easy acces clever completion
inoremap <C-x><C-x> <C-x><C-o>

" Remove unwanted whitespaces
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
nnoremap <silent> <Leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Replace word under cursor in line
nnoremap <Leader>r :OverCommandLine<CR>%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>s :OverCommandLine<CR>%s///g<Left><Left><Left>
" in visual mode, mapping a simple letter can conflict with snippets
vnoremap <C-r> <Esc>:OverCommandLine<CR>'<,'>s/

" Syntastic shortcuts : silent check and error summary
map <leader>c :SyntasticCheck<CR>
map <leader>e :Errors<CR>

" Tabularize ( align assignation ...)
nmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>

" Re-format the code, based on the LLVM style guide
" http://llvm.org/docs/CodingStandards.html
execute 'autocmd FileType c,cpp map <C-F> :pyf '.g:Vimmic_BASE.'extra'.g:file_sep.'clang-format.py<CR>'
execute 'autocmd Filetype c,cpp imap <C-F> <c-o>:pyf '.g:Vimmic_BASE.'extra'.g:file_sep.'clang-format.py<CR>'

" Navigation
"""""""""""""""""""""""""""""""""""""""

" Current tab : use C and standard move (keys or hjkl) to move inside the tab
map <C-Left> <C-w>h
map <C-Up> <C-w>k
map <C-Down> <C-w>j
map <C-Right> <C-w>l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h             " Issue in neovim
map <C-l> <C-W>l
nmap <Leader>v :vsplit<CR>
nmap <Leader>h :split<CR>

" Size of window
" Note : can use ctrl-maj on neovim only
" For the moment, can't map ctrl-h on neovim : issue
map <C-s>h :vertical res -5<cr>
map <C-s>j :res -5<cr>
map <C-s>k :res +5<cr>
map <C-s>l :vertical res +5<cr>

" Zoom the current focused split

" Confict with neovim, use :only to show only current
" Loose toogle effect
if has("nvim")
    " unmap the plugin maximize (neovim already
    " use this mapping for :only natively)
    autocmd VimEnter * unmap <c-w>o

    " teminal navigation
    tnoremap <Esc> <C-\><C-n>
else
    " we are on vim, leader o is great too
    map <Leader>o <c-w>o
endif

" Tabs navigation
map <Leader>> :tabnext<CR>
map <Leader>< :tabprevious<CR>
map <Leader>t :tabnew<CR>

" Toggle recent buffer with <Leader>-Tab
nnoremap <silent> <Leader><Tab> :b#<CR>

" Buffers
map <leader><Up> :BufExplorer<CR>
map <leader><Down> :ls<CR>
map <leader><Right> :bn<CR>
map <leader><Left> :bp<CR>

" Vim-airline
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Module shortcuts
"""""""""""""""""""""""""""""""""""""""

" Tagbar (http://blog.stwrt.ca/2012/10/31/vim-ctags)
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" Switch : Inverse
map <leader>i :Switch<cr>

" Vim-undo tree
nnoremap <leader>u :UndotreeToggle<cr>

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatic replace / correct
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Latex use ellipsis :
autocmd Filetype tex inoremap ... \ldots

" C / CPP fast -> and <<
au FileType c,cpp inoremap -. ->
au FileType cpp inoremap ,, <<
au FileType cpp inoremap <, <<


"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom function : used for daily actions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Update the vim configuration
function! Update()
    call dein#update()
endfunc
command! Update call Update()

" Ask vim-clang to compile the project to debug the autocompletion
function! DebugVimClang()
    let g:clang_diagsopt = 'rightbelow:6'
endfunction
command! DebugVimClang call DebugVimClang()

function! FoldAll()
    set foldmethod=syntax
    redraw
    sleep 100m
    set foldmethod=manual
endfunction
command! FoldAll call FoldAll()

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Post-configuration : used for plugins configuration and colors / themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load the ~/.vimrc.postconf if exist
if filereadable(g:Vimmic_POSTCONF)
  execute 'source' g:Vimmic_POSTCONF
endif


"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Todo section                                                              {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Switch to neocomplete / neosnippet but avoid the [B] completion
"
" xmledit is only for xml. Add xml, xhtml
"
"}}}

