" neoclide/coc.nvim
" Asynchronous completion compatible with LSP

let s:pluginName='coc.nvim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

  " Settings
  """"""""""

  " Diagnostic already done by ALE
  call coc#config('diagnostic.enable', 0)

  " For c/cpp
  call coc#config('languageserver', {
        \  'clangd': {
        \    'command': 'clangd',
        \    'rootPatterns': ['compile_commands.json'],
        \    'filetypes': ['c', 'cpp', 'objc', 'objcpp']
        \  }
        \ })

  if has('nvim')
    " not tested
    call coc#config('suggest.floatEnable', 1)
  endif

  " Extension
  """""""""""

  call coc#add_extension('coc-json', 'coc-python', 'coc-vimtex', 'coc-tsserver', 'coc-ultisnips')

  " Shortcut
  """"""""""
  " goto
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  " fix
  nmap <leader>pf :CocFix<cr>

  " Theme
  """""""
  " None

  " Note for deoplete and latex
  " This is new style
  " call deoplete#custom#var('omni', 'input_patterns', {
  "         \ 'tex': g:vimtex#re#deoplete
  "         \})

else
  if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
    echom s:pluginName.' not found, try :Update'
  endif
endif
