" Directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'vim-python/python-syntax'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'maralla/completor.vim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'fatih/vim-go'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-commentary'
Plug 'raimondi/delimitmate'
Plug 'w0rp/ale'
Plug 'jszakmeister/vim-togglecursor'
Plug 'dag/vim-fish'
call plug#end()

set termguicolors

set hidden

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Indent and autoreloading of outside saved files
filetype indent plugin on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent smartindent
set autoread

" Adjust backspace and eol movement
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set mouse=a

set cursorline

" Search Settings
set ignorecase
set smartcase
set hlsearch

set updatetime=100

syntax on
colorscheme gruvbox
set background=dark

set encoding=utf8

" Turn backup off, using git
set nobackup
set nowritebackup
set noswapfile

" Timeout length
set timeout timeoutlen=1000 ttimeoutlen=0

" Line numbering
set number
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" Python Settings
let g:python_highlight_all = 1

" NERDTree Settings
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__']
nmap nt :NERDTreeToggle<CR>
augroup nerdtree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
augroup END

" Easymotion Settings
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

" Snippet Settings
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-k>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

" Buffer Keybinds
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Go Settings
let g:go_fmt_command = 'goimports'
" let g:go_metalinter_autosave = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" Ale Settings
let g:ale_linters = {
\   'python': ['pyls', 'pylint'],
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

" let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_set_quickfix = 1
let g:ale_open_list = 1

" Ale Keybinds
nnoremap gd :ALEGoToDefinition<CR>
nnoremap gk :ALEHover<CR>
nnoremap fd :ALEFix<CR>
