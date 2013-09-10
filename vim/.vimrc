syntax on " Enable syntax highlighting

filetype on " Enable filetype detection
filetype indent on " Enable filetype-specific indenting
filetype plugin on " Enable filetype-specific plugins

" set ic " Case insensitive search
" set hls " Highlight search

set showmatch " Show matching brackets
set nu " Show line numbers

"set autoindent

set expandtab " use spaces instead of tab chars
set tabstop=2 " size of tab char if present
set shiftwidth=2 " size when use shift command
set softtabstop=2 " number of spaces inserted when using tab or removed when using backspace

" set hidden " move between buffers without error message

" function create the command :DiffSaved  . Use diffoff to exit thie mode
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()


vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
