"
" Skep's shitty Vim config
"

filetype on
filetype indent on
syntax on
set number
set tabstop=2
set nowrap
set hlsearch
set wildmenu
set wildmode=list:longest

autocmd BufRead,BufNewFile *.html setlocal tabstop=2 shiftwidth=2 softtabstop=2

set statusline=
set statusline+=\ %F\ %R\ %M\

set statusline+=%=

set statusline+=\ row:\ %l\ col:\ %c\ \|\ %p%%
set laststatus=2
