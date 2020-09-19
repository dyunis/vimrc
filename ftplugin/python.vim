" indentation settings from PEP-8
setlocal tabstop=8
setlocal shiftwidth=4
setlocal softtabstop=4

" comment symbol
let b:left_comment_symbol="#"

nnoremap <buffer> <leader>cc :<C-U> call CommentLine()<CR>
nnoremap <buffer> <leader>cu :<C-U> call UncommentLine()<CR>
nnoremap <buffer> <leader>db oimport pdb; pdb.set_trace()<Esc>
nnoremap <buffer> <leader>o :!python %
