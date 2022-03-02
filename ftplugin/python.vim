" indentation settings from PEP-8
setlocal tabstop=8
setlocal shiftwidth=4
setlocal softtabstop=4

" comment symbol
let b:left_comment_symbol="#"

nnoremap <buffer> <leader>cc :<C-U> call CommentLine()<CR>
nnoremap <buffer> <leader>cu :<C-U> call UncommentLine()<CR>
nnoremap <buffer> <leader>db oimport pdb; pdb.set_trace()<Esc>
" nnoremap <buffer> <leader>o :!python %
nnoremap <buffer> <leader>f8 :call flake8#Flake8()<CR>
nnoremap <leader>y :0,$!yapf<Cr><C-o>

" run yapf, then flake8 on write to be pep8 compliant
" from https://github.com/mindriot101/vim-yapf#why-you-may-not-need-this-plugin
autocmd BufWritePost *.py 0,$!yapf
autocmd BufWritePost *.py call flake8#Flake8()
