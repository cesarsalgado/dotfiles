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

" open replace dialog for replacing selection
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" With the following (for example, in vimrc), you can visually select text then press ~ to convert the text to UPPER CASE, then to lower case, then to Title Case. Keep pressing ~ until you get the case you want.
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv
