syntax on

filetype indent on

" use yank buffer with system clipboard
set clipboard=unnamedplus

" use mouse scroll
set mouse=a

set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set smartindent
set shiftround
set autoindent

set showmatch

set noshowmode
set autoread

autocmd BufRead,BufNewFile *.html setlocal tabstop=2 shiftwidth=2 softtabstop=2

augroup specify_filetype
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.txt set filetype=text
augroup END