" Directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'rust-lang/rust.vim'
Plug 'vim-python/python-syntax'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf'
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-commentary'
Plug 'raimondi/delimitmate'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'vim-ruby/vim-ruby'
Plug 'dag/vim-fish'
Plug 'ryanoasis/vim-devicons'
" Plug 'edkolev/tmuxline.vim'
" Plug 'jnurmine/zenburn'
Plug 'easymotion/vim-easymotion'

" Initialize plugin system
call plug#end()

set termguicolors

set hidden

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Devicons
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" Tagbar
nmap <F8> :TagbarToggle<CR>

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
\}

let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_set_quickfix = 1
let g:ale_open_list = 1

" FIX
nnoremap gd :ALEGoToDefinition<CR>
nnoremap gk :ALEHover<CR>
nnoremap fd :ALEFix<CR>

" Language Client Settings
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" nnoremap <silent> fd :call LanguageClient#textDocument_formatting()<CR>

" Snippet Settings
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-k>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

" Buffer Keybinds
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

syntax on
colorscheme gruvbox
set background=dark

" Line numbering
set number
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" Python Settings
let g:python_highlight_all = 1

filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent

set mouse=a

set cursorline

set ignorecase
set smartcase

set updatetime=500

" NERDTree Settings inc. autotoggle
nmap nt :NERDTreeToggle<CR>
augroup nerdtree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
augroup END

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

" Easymotion Settings
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
