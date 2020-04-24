" indentation settings
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

" recompile latex document on write, stop compilation if there's an error
" redraw redraws the screen to flush command output
" possibilities: BufWritePost, InsertLeave, TextChanged, TextChangedI
autocmd BufWritePost *.tex silent! execute "!pdflatex -output-directory '%:p:h' %" | redraw!

" latex snippets

" latex skeleton
nnoremap <leader>skl :-1read $HOME/.vim/snippets/latex/skeleton<CR>5j
" for align*
nnoremap <leader>al :-1read $HOME/.vim/snippets/latex/align<CR>ji
" for anonymous equations (\[ \])
nnoremap <leader>mm :-1read $HOME/.vim/snippets/latex/nolabel_math<CR>2la
" for inline equations $ $
nnoremap <leader>im a$$<Esc>hi
" for itemize
nnoremap <leader>it :-1read $HOME/.vim/snippets/latex/itemize<CR>jA
" for enumerate
nnoremap <leader>en :-1read $HOME/.vim/snippets/latex/enumerate<CR>jA

" comment symbol for commenting macro
let b:left_comment_symbol="%"

nnoremap <buffer> <leader>cc :<C-U> call CommentLine()<CR>
nnoremap <buffer> <leader>cu :<C-U> call UncommentLine()<CR>

" works similar to the autocmd above, but latex needs pdflatex, bibtex, pdflatex
" pdflatex in order to format bibliographies correctly, takes a while so
" encapsulate in a function
function! CompileWithBibliography() 
  silent! execute "!pdflatex -output-directory '%:p:h' %; bibtex '%:r'.aux; pdflatex -output-directory '%:p:h' %; pdflatex -output-directory '%:p:h' %" | redraw!
endfunction

function! RemoveBibliography()
  silent! execute "!rm '%:r'.bbl; rm '%:r'.blg" | redraw! 
endfunction

function! OpenPDF()
  silent! execute "!open '%:r'.pdf" | redraw!
endfunction

" call function with leader key
nnoremap <leader>b :call CompileWithBibliography()<CR>
nnoremap <leader>rb :call RemoveBibliography()<CR>
nnoremap <leader>o :call OpenPDF()<CR>
