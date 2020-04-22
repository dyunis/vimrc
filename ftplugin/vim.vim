setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

" comment symbol
let b:left_comment_symbol='"'

nnoremap <buffer> <leader>cc :<C-U> call CommentLine()<CR>
nnoremap <buffer> <leader>cu :<C-U> call UncommentLine()<CR>
