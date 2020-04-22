" indentation settings from Google HTML/CSS Style Guide
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

" html skeleton
nnoremap <leader>skl :-1read $HOME/.vim/snippets/html/skeleton.html<CR>4j

" comment symbol
let b:left_comment_symbol="<!--"
let b:right_comment_symbol="-->"

nnoremap <leader>cc :<C-U> call CommentBlock()<CR>
nnoremap <leader>cu :<C-U> call UncommentBlock()<CR>
