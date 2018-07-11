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
  call dein#add('junegunn/fzf.vim')
  call dein#add('w0rp/ale')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('sebastianmarkow/deoplete-rust')
  call dein#add('zchee/deoplete-go')

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
set completeopt+=menuone

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

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#python_path = '/usr/bin/python'
let g:deoplete#sources#rust#racer_binary='/home/george/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/george/Downloads/rust/src'
nmap <buffer> K <plug>DeopleteRustShowDocumentation
let g:deoplete#sources#go#gocode_binary = '/home/george/go/bin/gocode'

" NERDTree Settings inc. autotoggle
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__', '.git$']
nmap nt :NERDTreeToggle<CR>
augroup nerdtree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
augroup END

" Easymotion Settings
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

" Python Settings
let g:python_highlight_all = 1

" Ale Settings
let g:ale_linters = {
\   'python': ['pyls', 'pylint', 'pyre'],
\   'rust': ['rls', 'rustc'],
\   'vim': ['vint'],
\   'rst': ['proselint', 'rstcheck'],
\   'markdown': ['proselint'],
\}
let g:ale_fixers = {
\   'python': ['black'],
\   'rust': ['rustfmt'],
\   'go': ['goimports'],
\}

let g:airline#extensions#ale#enabled = 1
let g:ale_python_black_options = '-l 79'

" Ale Keybinds
nnoremap gd :ALEGoToDefinition<CR>
nnoremap gk :ALEHover<CR>
nnoremap fd :ALEFix<CR>

" Airline Settings
let g:airline#extensions#tabline#enabled=1

" Markdown Settings
let g:vim_markdown_folding_disabled=1

" FZF hide statusline
augroup fuzzyf
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
