" general settings
set encoding=utf-8
set tabstop=4 " set tab to 4 spaces
set shiftwidth=4 " set size of indent to 4 spaces
set softtabstop=4 " set number of columns for tab
set expandtab " make tab key expand \t to spaces
set autoindent " indent new line to same level as previous line
set wrap " wrap text to new line after exceeding [textwidth]
set textwidth=79 " line length before wrapping
set colorcolumn=81 " display a marker column at [textwidth]

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
set hlsearch " enable last search highlighting
colorscheme dim  " colorscheme in .vim/colors/
set background=dark " colorscheme mode
set number " set absolute line numbering (outer number)
" set relativenumber " set relative line numbering (inner numbers)

" remap escape key, tab to switch between delimiters
" need a remap that works nicely with semicolons
inoremap <C-L> <Esc>
vnoremap <C-L> <Esc>
nnoremap <tab> %
vnoremap <tab> % 

" disable arrow key navigation in insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" disable misclicking f1 and seeing help all the time while trying to escape
inoremap <F1> <Esc>
nnoremap <F1> <Esc>
vnoremap <F1> <Esc>

" unset the last search pattern highlighting in normal mode
nnoremap <CR> :noh<CR>

" remap navigating between splits to get rid of ctrl-w leader
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
