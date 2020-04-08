" general settings
set encoding=utf-8
set tabstop=4 " set tab to 4 spaces
set shiftwidth=4 " set size of indent to 4 spaces
set softtabstop=4 " set number of columns for tab

" for html/js/css/cpp/shell/latex, 2 space tabs
autocmd BufRead,BufNewFile *.html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.js setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.sh setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.tex setlocal tabstop=2 shiftwidth=2 softtabstop=2
" for tex files, compile pdf on write
" this particular version stops compilation if there's an error
autocmd BufWritePost *.tex silent! execute "!pdflatex -output-directory '%:p:h' %" | redraw!

set expandtab " make tab key expand \t to spaces
set autoindent " indent new line to same level as previous line
set wrap " wrap text to new line after exceeding [textwidth]
set colorcolumn=80 " display a marker column at [textwidth]

"statusline config
set laststatus=2 " display statusline always
set statusline=%F%h%r "filename, help, readonly
set statusline+=%3.m " modified flag
set statusline+=%= " right justified after this
set statusline+=\ %3.l,%-3.c "line, column number
set statusline+=\ %3.p%% " percentage
set statusline+=\ of
set statusline+=\ %-3.L "total lines in file

" syntax and colors
syntax on " enable syntax highlighting
set incsearch " enable incremental search highlighting as you type
set hlsearch " enable last search highlighting
colorscheme dim  " colorscheme in .vim/colors/
set background=dark " colorscheme mode
set number " set absolute line numbering (outer)
set relativenumber " set relative line numbering (inner) to replace visual mode

" remap escape key, needs to work nicely with semicolons
inoremap <C-L> <Esc>
vnoremap <C-L> <Esc>
" remap tab to switch between delimiters
nnoremap <tab> %
vnoremap <tab> % 

" unset the last search pattern highlighting in normal mode
nnoremap <CR> :noh<CR>

" netrw file browser settings
let g:netrw_banner=0 " disables top banner of file browser
let g:netrw_altv=1 " open splits to the right (press v to open a file in a split)
let g:netrw_liststyle=3 " opens as tree view
" :help netrw
