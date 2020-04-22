" indentation settings from Google HTML/CSS Style Guide
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

" comment symbol
let b:left_comment_symbol="/*"
let b:right_comment_symbol="*/"

" in /plugin/comments.vim
nnoremap <leader>cc :<C-U> call CommentBlock()<CR>
nnoremap <leader>cu :<C-U> call UncommentBlock()<CR>
