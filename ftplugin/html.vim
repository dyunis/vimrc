" indentation settings from Google HTML/CSS Style Guide
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

" html skeleton
nnoremap <leader>skl :-1read $HOME/.vim/snippets/html/skeleton<CR>4j

" comment symbol
let b:left_comment_symbol="<!--"
let b:right_comment_symbol="-->"

nnoremap <buffer> <leader>cc :<C-U> call CommentBlock()<CR>
nnoremap <buffer> <leader>cu :<C-U> call UncommentBlock()<CR>
nnoremap <leader>o :!open %<CR><CR>
