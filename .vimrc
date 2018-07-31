" Try to load minpac.
silent! packadd minpac

if !exists('*minpac#init')
    " minpac is not available.

    colorscheme default
else
    " minpac is available.
    call minpac#init()
    call minpac#add('k-takata/minpac', {'type': 'opt'})

    " ------------------------------------------------------------------------
    " COLORSCHEME & SYNTAX
    " ------------------------------------------------------------------------

    call minpac#add('morhetz/gruvbox')
    call minpac#add('rust-lang/rust.vim')
    call minpac#add('vim-python/python-syntax')
    call minpac#add('fatih/vim-go')
    call minpac#add('pangloss/vim-javascript')
    call minpac#add('mxw/vim-jsx')
    call minpac#add('cespare/vim-toml')
    call minpac#add('plasticboy/vim-markdown')
    call minpac#add('posva/vim-vue')

    colorscheme gruvbox

    let g:python_highlight_all = 1

    let g:go_fmt_command = 'goimports'
    let g:go_highlight_extra_types = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_variable_declarations = 1
    let g:go_highlight_variable_assignments = 1

    let g:vim_markdown_folding_disabled=1

    " ------------------------------------------------------------------------
    " NERDTREE & GIT
    " ------------------------------------------------------------------------

    call minpac#add('scrooloose/nerdtree')
    call minpac#add('xuyuanp/nerdtree-git-plugin')
    call minpac#add('airblade/vim-gitgutter')

    let g:NERDTreeShowHidden=1
    let g:NERDTreeIgnore = ['\.pyc$', '__pycache__', '.git$']
    nmap nt :NERDTreeToggle<CR>
    augroup nerdtree
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
    augroup END

    " ------------------------------------------------------------------------
    " QUALITY OF LIFE
    " ------------------------------------------------------------------------

    call minpac#add('raimondi/delimitmate')
    call minpac#add('tpope/vim-commentary')
    call minpac#add('tpope/vim-unimpaired')

    " ------------------------------------------------------------------------
    " AIRLINE
    " ------------------------------------------------------------------------

    call minpac#add('vim-airline/vim-airline')

    set noshowmode
    let g:airline_powerline_fonts=1
    let g:airline#extensions#ale#enabled=1
    let g:airline#extensions#tabline#enabled=1

    " ------------------------------------------------------------------------
    " EASYMOTION
    " ------------------------------------------------------------------------

    call minpac#add('easymotion/vim-easymotion')

    let g:EasyMotion_do_mapping = 0
    nmap s <Plug>(easymotion-overwin-f2)
    let g:EasyMotion_smartcase = 1

    " ------------------------------------------------------------------------
    " FZF.VIM
    " ------------------------------------------------------------------------

    call minpac#add('junegunn/fzf.vim')

    augroup fuzzyf
        autocmd! FileType fzf
        autocmd  FileType fzf set laststatus=0 noshowmode noruler
            \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
    augroup END

    " ------------------------------------------------------------------------
    " COMPLETOR.VIM
    " ------------------------------------------------------------------------

    call minpac#add('maralla/completor.vim')
    call minpac#add('sirver/ultisnips')
    call minpac#add('honza/vim-snippets')
    let g:completor_python_binary='/usr/bin/python3'
    let g:completor_gocode_binary='~/go/bin/gocode'
    let g:completor_racer_binary='~/.cargo/bin/racer'
    set completeopt+=menuone,noselect,noinsert
    set shortmess+=c

    " ------------------------------------------------------------------------
    " ALE
    " ------------------------------------------------------------------------

    call minpac#add('w0rp/ale')

    let g:ale_linters = {
    \   'python': ['pyls', 'pylint', 'pyre'],
    \   'rust': ['rls', 'rustc'],
    \   'go': ['gometalinter'],
    \   'vim': ['vint'],
    \}
    let g:ale_fixers = {
    \   'python': ['black'],
    \   'rust': ['rustfmt'],
    \   'go': ['goimports'],
    \}

    let g:ale_set_quickfix=1
    let g:ale_python_black_options='-l 79'

    nnoremap gd :ALEGoToDefinition<CR>
    nnoremap gk :ALEHover<CR>
    nnoremap fd :ALEFix<CR>

endif

" ------------------------------------------------------------------------
" COMMON SETTINGS
" ------------------------------------------------------------------------

filetype plugin indent on
syntax enable
set encoding=utf-8
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set hidden
set background=dark
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent smartindent
set autoread
set mouse=a
set cursorline
set ignorecase
set smartcase
set hlsearch
set ttimeoutlen=0
set updatetime=500
set display+=lastline
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set number
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END
