" indentation settings required to make code blocks work
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

" for display math context
nnoremap <leader>mm :-1read $HOME/.vim/snippets/markdown/math_mode<CR>ji
" for inline math
nnoremap <leader>im a$``$<Esc>hi
" for math mode aligned 
nnoremap <leader>al :-1read $HOME/.vim/snippets/markdown/aligned<CR>ji
