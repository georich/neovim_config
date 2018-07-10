"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/george/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/george/.cache/dein')
  call dein#begin('/home/george/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/george/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('morhetz/gruvbox')
  call dein#add('rust-lang/rust.vim', { 'on_ft': 'rust' })
  call dein#add('vim-python/python-syntax', { 'on_ft': 'python' })
  call dein#add('pangloss/vim-javascript', { 'on_ft': 'javascript' })
  call dein#add('mxw/vim-jsx', { 'on_ft': 'javascript' })
  call dein#add('cespare/vim-toml', { 'on_ft': 'toml' })
  call dein#add('dag/vim-fish', { 'on_ft': 'fish' })
  call dein#add('plasticboy/vim-markdown', { 'on_ft': 'markdown' })
  call dein#add('posva/vim-vue', { 'on_ft': 'vue' })
  call dein#add('scrooloose/nerdtree')
  call dein#add('xuyuanp/nerdtree-git-plugin')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('raimondi/delimitmate')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('vim-airline/vim-airline')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('sirver/ultisnips')
  call dein#add('honza/vim-snippets')
  call dein#add('ncm2/ncm2')
  call dein#add('roxma/nvim-yarp')
  call dein#add('ncm2/ncm2-bufword')
  call dein#add('ncm2/ncm2-path')
  call dein#add('ncm2/ncm2-ultisnips')
  call dein#add('junegunn/fzf.vim')
  call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
"End dein Scripts-------------------------

set encoding=utf-8
set termguicolors
set hidden
set number
set background=dark
colorscheme gruvbox
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent smartindent
set autoread
set mouse=a
set cursorline
set ignorecase
set smartcase
set hlsearch
set ttimeoutlen=0
set updatetime=500

" Adjust backspace and eol movement
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Line numbering
set number
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END

" ncm2 settings
autocmd BufEnter * call ncm2#enable_for_buffer() " enable ncm2 for all buffer
set completeopt+=noinsert,menuone,noselect " note that must keep noinsert in completeopt, the others is optional
au TextChangedI * call ncm2#auto_trigger() " enable auto complete for `<backspace>`, `<c-w>` keys
inoremap <c-c> <ESC> " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" NERDTree Settings inc. autotoggle
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__', '.git$']
nmap nt :NERDTreeToggle<CR>
augroup nerdtree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
augroup END

" Easymotion Settings
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

" Python Settings
let g:python_highlight_all = 1

" LanguageClient-neovim Settings
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'python': ['pyls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Airline Settings
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" Markdown Settings
let g:vim_markdown_folding_disabled=1
