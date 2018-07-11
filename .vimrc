set encoding=utf-8

set termguicolors
syntax on
set background=dark
colorscheme gruvbox

set hidden

filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent smartindent
set autoread
set mouse=a
set cursorline
set ignorecase
set smartcase
set hlsearch

set completeopt+=menuone

set ttimeoutlen=0
set updatetime=500

" Adjust backspace and EOL movement
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Line Numbering
set number
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END
