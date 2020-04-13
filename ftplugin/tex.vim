" indentation settings
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

" recompile latex document on write, stop compilation if there's an error
" redraw redraws the screen to flush command output
autocmd BufWritePost *.tex silent! execute "!pdflatex -output-directory '%:p:h' %" | redraw!

" latex snippets
" for align*
nnoremap ,al :-1read $HOME/.vim/snippets/latex/align<CR>ji
" for anonymous equations (\[ \])
nnoremap ,mm :-1read $HOME/.vim/snippets/latex/nolabel_math<CR>2la
" for itemize
nnoremap ,it :-1read $HOME/.vim/snippets/latex/itemize<CR>ji
" for enumerate
nnoremap ,en :-1read $HOME/.vim/snippets/latex/enumerate<CR>ji
