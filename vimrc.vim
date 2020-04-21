" general settings
set encoding=utf-8
set tabstop=4 " set tab to 4 spaces
set shiftwidth=4 " set size of indent to 4 spaces
set softtabstop=4 " set number of columns for tab

" different filetype options
filetype plugin on " enable searching for filetype specific things
autocmd BufNewFile,BufReadPre * let b:did_ftplugin = 1 " get rid of vim defaults
" filetypes are in $VIM/ftplugin, or ~/.vim/ftplugin
" currently configs for python/html/js/css/cpp/shell/latex 
" the below is because on opening a new .tex, vim thinks it's plaintex
let g:tex_flavor='latex'

set expandtab " make tab key expand \t to spaces
set autoindent " indent new line to same level as previous line
set wrap " wrap text to new line after exceeding [textwidth]
set colorcolumn=80 " display a marker column at [textwidth]
set wildmenu " when entering in vim command line, press tab to see autocomplete options
set path+=** " tab completion for files in subdirs of current directory

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
" set relativenumber " set relative line numbering (inner) to replace visual mode

" remap escape key, needs to work nicely with semicolons
inoremap jk <Esc>
inoremap kj <Esc>
vnoremap jk <Esc>
vnoremap kj <Esc>

" if a very long line wraps, move visually without skipping the wrapped bit
nnoremap j gj
nnoremap k gk

" highlight last inserted text
" gv already displays last visual selection
nnoremap gV `[v`]

" unset the last search pattern highlighting in normal mode with return
nnoremap <CR> :noh<CR>

" remap leader from \ to , (easier to reach)
let mapleader=","

" netrw file browser settings
let g:netrw_banner=0 " disables top banner of file browser
let g:netrw_altv=1 " open vertical splits to the right (press v to open)
let g:netrw_alto=1 " open horizontal splits below browser (press o to open)
let g:netrw_liststyle=3 " opens as tree view
let g:netrw_winsize=85 " 85% new window size for splits opened from file browser
" :help netrw
