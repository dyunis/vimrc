" indentation settings required to make code blocks work
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

" for display math context
nnoremap <leader>mm :-1read $HOME/.vim/snippets/markdown/math_mode<CR>ji
" for inline math
nnoremap <leader>im a$``$<Esc>hi
" for math mode aligned 
nnoremap <leader>al :-1read $HOME/.vim/snippets/markdown/aligned<CR>ji
